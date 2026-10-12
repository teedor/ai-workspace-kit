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
  wherever the kit says "Anthropic". At `/setup`'s personal details
  question, and again before other people's details come in, tell me to
  check in ChatGPT's settings whether OpenAI may use my conversations to
  improve its models, and to turn that off if I'd rather it didn't.
- **Guard rails.** `.claude/settings.json` doesn't apply to you. Inside
  this folder your sandbox can let commands run without asking, even ones
  that delete. `.codex/rules/kit.rules` makes you ask before `rm`, `git
  push`, `git reset`, `git clean`, `git checkout`, `git restore`, `git
  switch`, `git stash`, `git -C` and `Remove-Item`; ask first anyway for
  anything else hard to undo (rule 8): `private/` has no snapshot. Never
  open `.env`, `.pem` or key files (rule 3).
- **Snapshots ask.** Your sandbox keeps `.git` read-only, so `git init` and
  every snapshot need my yes. Warn me before the first one that this is
  expected.
- **Trusting this folder.** Tell me to choose "Trust and continue" when
  Codex asks, or the `critic` agent and this folder's guard-rail rules won't
  load.
- **Setup extras.** "Make the allowance last" is for Claude plans: skip it.
  If I mention running out, tell me `/usage` shows my usage.
- **Packs.** The linked repos pack is for Claude Code only, for now. The
  visuals pack's diagrams work as written; its picture script needs a Google
  key of its own. The build pack works as written, except with code in a
  linked repository, which needs the linked repos pack (Claude Code only).
  Its guard rails are rules you follow, not locks: never run tests or the
  app until "Safe to run?" says yes.
- **My computer.** If you aren't told which system I'm on, ask once (setup
  step 2 records it).
