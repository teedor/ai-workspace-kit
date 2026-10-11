# GitHub Copilot CLI: a plan for a shared core and thin adapters

*Status: proposal, not built. Facts checked on 2026-10-11 against GitHub's
documentation source (github/docs at commit be38ec5, 2026-10-09) and the
github/copilot-cli changelog (to 1.0.95). Recheck before building: both
tools change monthly.*

## What Copilot CLI already reads from this kit

Copilot CLI (the `copilot` command, and the GitHub Copilot desktop app built
on it) reads several Claude Code locations directly:

| Kit file | Copilot CLI | Source |
|---|---|---|
| `CLAUDE.md` (and `.claude/CLAUDE.md`) | Read as instructions, "in Git root and cwd", alongside `AGENTS.md` and `.github/copilot-instructions.md`, combined with no precedence order | CLI command reference; "Add custom instructions" |
| `.claude/skills/<name>/SKILL.md` | Read as project skills. Supports `name`, `description`, `allowed-tools`, `disable-model-invocation` | "About agent skills"; CLI command reference |
| `.claude/agents/*.md` | Read as project custom agents. Claude tool names are aliases (`Read` → read, `Grep`/`Glob` → search, `Edit`/`Write` → edit, `Bash` → execute); unknown names are ignored | CLI command reference; "Custom agents configuration" |
| `.claude/settings.json` | Only the shared subset: `hooks`, `disableAllHooks`, `enabledPlugins`, `extraKnownMarketplaces`, `companyAnnouncements`. **Not** `permissions`, and not `model` | CLI config directory reference |
| `~/.claude/CLAUDE.md`, `~/.claude/skills/` | **Not read.** Changelog 1.0.36: "Custom agents, skills, and commands from ~/.claude/ are no longer loaded" | Changelog |

So a Copilot user who opens a kit project today gets the rules and all
thirteen skills (with `/setup` and `/red-team` still typed-only), and the
read-only `critic` agent. What they don't get:

1. **The global layer.** Copilot's equivalents are
   `~/.copilot/copilot-instructions.md` and `~/.copilot/skills/` (or
   `~/.agents/skills/`). `/setup`'s "About me", `/new-skill`, `/new-project`,
   `/tailor` and the study pack all write to `~/.claude/...`.
2. **The permission guard rails.** A repository can't ship allow, ask or
   deny lists to Copilot CLI: unsupported repository keys "are silently
   ignored". By default it already asks before "destructive shell commands,
   editing files, or accessing URLs", but nothing stops `.env` being read.
   The one thing a repository can enforce is a hook (`preToolUse`), which it
   also reads from `.claude/settings.json`.
3. **Accurate wording.** The kit says "Claude" throughout, and that what
   Claude reads "is sent to Anthropic". Under Copilot it goes to GitHub and
   the model provider. `CLAUDE.local.md` has no Copilot equivalent.

## Proposal: shared core, thin adapters

Keep **one** set of files that both tools read, and put only the
differences in a small per-tool adapter.

- **Core (unchanged locations):** `CLAUDE.md`, `.claude/skills/`,
  `.claude/agents/`, `extras/`. Both tools read these. Over time, word them
  so they don't depend on the tool: "you" rather than "Claude" in rules,
  and "the service you're using" where data goes, with the name filled in
  by the adapter.
- **Claude Code adapter:** what exists today: `.claude/settings.json` with
  permissions, and the global layer at `~/.claude/`.
- **Copilot adapter**, as a pack in `extras/copilot/`, installed by
  `/setup` when it notices it's running in Copilot CLI (or when asked):
  1. `.github/copilot-instructions.md`: a short file that says which tool
     this is; that wherever the kit says `~/.claude/CLAUDE.md` or
     `~/.claude/skills/`, use `~/.copilot/copilot-instructions.md` and
     `~/.copilot/skills/`; that data goes to GitHub and the model provider;
     and that the permission rules in `.claude/settings.json` don't apply,
     so rule 8 (ask before anything hard to undo) is on trust plus
     Copilot's own prompts.
  2. A `preToolUse` hook that blocks reading `.env`, `.pem` and key files,
     and stops `git push` without a prompt, written once and tested in both
     tools (Copilot reads hooks from `.claude/settings.json`; whether one
     hook definition works unchanged in both is **not yet verified**).
  3. A line in the guide: install with WinGet, Homebrew or npm (Node 22+);
     on Windows it needs PowerShell 6 or later, which isn't the built-in
     one; costs are counted in AI credits.
- **No duplicate skills.** Copilot already reads `.claude/skills/`, so
  there's no build step and nothing to keep in sync.

## Open questions for a real run

- Does Copilot honour `disable-model-invocation` and the skills' wording
  ("Claude, …") well enough in practice?
- Does `.claude/agents/critic.md` load as a custom agent there (GitHub's
  examples use `*.agent.md` files)?
- Can one hook file serve both tools?
- How does the kit's first line ("📁 You're in …") and the two-layer model
  feel with Copilot's combined, unordered instructions?

## Recommendation

Don't build the adapter yet. First do the Claude end-to-end run, then one
Copilot run on a copy of a finished project to answer the open questions.
Then build `extras/copilot/` as above: three small files and a guide
section, with no change to the core.
