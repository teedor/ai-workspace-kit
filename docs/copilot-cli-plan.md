# GitHub Copilot CLI: a plan for a shared core and thin adapters

*Status: proposal, not built. Facts checked on 2026-10-11 against GitHub's
documentation source (github/docs at commit be38ec5, 2026-10-09) and the
github/copilot-cli changelog (to 1.0.95). Paths below are under
`content/copilot/` in github/docs. Recheck before building: both tools
change monthly.*

## What Copilot CLI already reads from this kit

Copilot CLI (the `copilot` command, and the GitHub Copilot desktop app built
on it) reads several Claude Code locations directly:

| Kit file | Copilot CLI | Source |
|---|---|---|
| `CLAUDE.md` (and `.claude/CLAUDE.md`) | Read as instructions, "in Git root and cwd", alongside `AGENTS.md` and `.github/copilot-instructions.md`. They're combined with no precedence order | `how-tos/copilot-cli/customize-copilot/add-custom-instructions.md` |
| `.claude/skills/<name>/SKILL.md` | Read as project skills, with `name`, `description`, `allowed-tools` and `disable-model-invocation` | `reference/copilot-cli-reference/cli-command-reference.md` |
| `.claude/agents/*.md` | Read as project custom agents; no `.agent.md` suffix needed. Claude tool names work as aliases (`Read` → read, `Grep`/`Glob` → search, `Edit`/`Write` → edit, `Bash` → execute), and unknown names are ignored. So the kit's read-only `critic` stays read-only | same; `reference/custom-agents-configuration.md` |
| `.claude/settings.json` | Only a shared subset "such as" `hooks`, `disableAllHooks`, `enabledPlugins`, `extraKnownMarketplaces`, `companyAnnouncements`. **Not** `permissions` | `reference/copilot-cli-reference/cli-config-dir-reference.md` |
| `~/.claude/CLAUDE.md`, `~/.claude/skills/` | **Not read.** User-level instructions come only from `~/.copilot/`; changelog 1.0.36: "Custom agents, skills, and commands from ~/.claude/ are no longer loaded" | CLI command reference (instructions table); changelog |

So a Copilot user who opens a kit project today gets the rules, all
thirteen skills (with `/setup` and `/red-team` still typed-only) and the
read-only `critic` agent. What they don't get:

1. **A way in.** The README, `INSTALL.md` and `/new-project` all describe
   the Claude app's screens (Code tab, Environment: Local, Permission mode).
2. **The global layer.** Copilot's equivalents are
   `~/.copilot/copilot-instructions.md` and `~/.copilot/skills/` (or
   `~/.agents/skills/`). "About me", `/new-skill`, `/new-project`, `/tailor`
   and the study pack all write to `~/.claude/...`.
3. **The permission guard rails.** A repository can't ship file allow, ask
   or deny lists to Copilot CLI: unsupported repository keys "are silently
   ignored" (it can add URL denies and disable skills). By default Copilot
   asks before "destructive shell commands, editing files, or accessing
   URLs", but reads are approved automatically, so nothing stops a `.env`
   file being read. A hook (`preToolUse`) is the one thing a repository can
   enforce.
4. **True statements about safety.** Several kit files say the `.env` file
   "is blocked", a linked repository is "blocked" from edits, or what Claude
   reads "is sent to Anthropic". Under Copilot the first two aren't
   enforced and the third is wrong (it goes to GitHub and the model
   provider). *Done already, for both tools:* rule 3 now also tells the
   model never to open `.env`, `.pem` or key files, even where nothing
   blocks it.

Two more things to expect: session-wide approvals are coarser in Copilot
("yes for the rest of the session" on `rm` covers every `rm`), and the
kit's routine note-keeping, which runs without prompts in Claude Code,
prompts every time in Copilot, which pushes people towards "allow all".

## Proposal: shared core, thin adapters

Keep **one** set of files that both tools read, and put only the
differences in a small per-tool adapter.

- **Core (unchanged locations):** `CLAUDE.md`, `.claude/skills/`,
  `.claude/agents/`, `extras/`. Both tools read these, so there's no build
  step and nothing to keep in sync. Over time, word them so they don't
  depend on the tool ("you" rather than "Claude" in rules; "the service
  you're using" where data goes, named by the adapter).
- **Claude Code adapter:** what exists today: `.claude/settings.json` with
  permissions, and the global layer at `~/.claude/`.
- **Copilot adapter**, a pack in `extras/copilot/`. It only ever goes in a
  **personal** workspace, never a team repository (instruction files there
  change every colleague's Copilot); work code is reached through
  `extras/linked-repos`.
  1. **An install sentence and hand-over** for Copilot: open a terminal in
     the folder, run `copilot`, trust the folder, type `/setup`.
  2. `.github/copilot-instructions.md`: which tool this is; that wherever
     the kit says `~/.claude/CLAUDE.md` or `~/.claude/skills/`, use
     `~/.copilot/copilot-instructions.md` and `~/.copilot/skills/`; where
     data goes; that the kit's "blocked" statements are best effort here
     (don't open those files; don't edit read-only repositories); and that
     the study pack's log records the model actually used each time.
  3. A **Copilot-only hook**, `.github/hooks/kit-guard.json` (not shared
     with Claude Code, which has its deny list): deny reads of `.env`,
     `.pem` and key files; return "ask" for `git push`, `reset`, `clean`,
     `rm` and `Remove-Item`, so a session-wide approval can't cover them;
     and allow on any internal error, because a Copilot hook that crashes
     denies every tool call. Copilot accepts Claude-style hook layouts but
     reads the decision from a different field, so it's written for Copilot
     and tested there. It still runs under "allow all", which is the main
     reason to have it. Call it "a guard, not a lock".
  4. **One guide section,** "Using GitHub Copilot instead", next to "Prefer
     the terminal?", with a short table of differences. The main path stays
     on one tool. It covers: install with WinGet, Homebrew or npm (Node.js
     22 or later); on Windows the install page lists PowerShell 6 or later, though
     recent versions fall back to the built-in Windows PowerShell 5.1 (with
     some workarounds for it); costs are counted in AI credits (the
     README's "premium requests" is the older scheme).

## Open questions for a real run

- Does the "📁 You're in …" first line still show that the rules loaded,
  given Copilot's combined, unordered instructions?
- Do any kit skill names (`/setup`, `/start`) clash with Copilot's built-in
  slash commands?
- How do the skills' "Claude, …" wording and the two-layer model feel in
  practice?
- Can a Copilot Business administrator switch the CLI off by policy?
- How many prompts does a normal session raise, and does that wear down
  rule 8?

## Recommendation

Don't build the adapter yet. Do one Copilot run on a copy of a finished
project, alongside the Claude end-to-end run if someone with Copilot is
available, to answer the open questions. Then build `extras/copilot/` as
above: an install sentence, an instructions file, a hook and a guide
section, with no change to the core.
