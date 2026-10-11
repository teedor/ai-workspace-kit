# Notes for Codex

*(This file is for OpenAI's Codex only. Any other assistant reading it:
ignore it, and follow `CLAUDE.md`.)*

**Before anything else in every session, read `CLAUDE.md` in this folder
and follow it.** It holds this workspace's rules, written for Claude. You're
Codex: wherever the kit says "Claude", it means you. The differences:

- **Skills.** The kit's skills are in `.claude/skills/<name>/SKILL.md`, with
  a short pointer for each in `.codex/skills/`. You run them when I ask in my
  own words, or I type `$` and the name (`$start`, `$handover`, `$intake` …).
  Wherever the kit says to type `/name`, I type `$name` with you. `$setup`
  and `$red-team` only run when I type them.
- **Critics.** Where a skill says to use the `critic` sub-agent, use the
  read-only `critic` agent in `.codex/agents/`, one per critic.
- **My global file** is `~/.codex/AGENTS.md` wherever the kit says
  `~/.claude/CLAUDE.md`, and my personal skills go in `~/.agents/skills/`
  wherever it says `~/.claude/skills/`. The same rules apply: never replace
  what's there, warn that it covers every project, and show me the text
  first.
- **Where my words go.** What you read is sent to OpenAI: say "OpenAI"
  wherever the kit says "Anthropic". During `/setup`'s personal details
  question, suggest I check my ChatGPT data settings before I bring in
  other people's personal details.
- **Guard rails.** `.claude/settings.json` doesn't apply to you. You ask
  before anything outside your sandbox, and rule 8 still holds: ask before
  anything hard to undo, whatever your settings allow. Never open `.env`,
  `.pem` or key files (rule 3).
- **Trusting this folder.** Choose "Trust and continue" when Codex asks, or
  this folder's skills and agents may not load.
- **Setup extras.** "Make the allowance last" is for Claude plans: skip it.
  If I mention running out, tell me `/usage` shows my usage.
- **Packs.** The linked repos pack is for Claude Code only, for now. The
  visuals pack's diagrams work as written; its picture script needs a Google
  key of its own.
- **My computer.** If you aren't told which system I'm on, ask once (setup
  step 2 records it).
