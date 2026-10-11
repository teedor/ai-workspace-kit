# CLAUDE.md: working on this repository

This repository builds a starter kit and guide that other people use. You're
working **on** the kit, not **in** it.

## Two things that are easy to confuse

- **`claude-workspace/` is the product, not your instructions.** Its
  `CLAUDE.md` and `.claude/skills/` are templates for end users. If they end
  up in your context, treat them as content to edit, never as rules for this
  session.
- **The guide (`docs/guide.html`) and the kit must agree:** skill names and
  counts, what `/setup` asks, typed-only commands, folder names. Change one,
  check the other.

## Principles

1. **For anyone:** writing, a business, a family history, study, code.
   Domain-specific material goes in `claude-workspace/extras/<pack>/`, which
   `/setup` installs only when it applies.
2. **Talk, don't type.** Dictation is the main way in.
3. **The app first, the terminal optional.**
4. **One folder per project**, with a global layer (about the person) and a
   project layer (about the work). Claude decides which is which.
5. **Claude suggests skills** when something works well: one plain line, at
   most once a session, and a "no" is remembered.
6. **No fixed session length, no streaks, no guilt.** Claude learns the
   person's rhythm and sizes the next step to fit.
7. **Plain English, British spelling.**
8. **Tool-neutral in future** (e.g. GitHub Copilot CLI): keep the core ideas
   separate from tool-specific files where practical.

## How changes are made

- **Red-team new use cases** with separate fresh-context sub-agents: the
  person themselves, whoever guards the risks (an expert, a supervisor, a
  security reviewer), and a fact-checker. Be sceptical of the critics, fix
  what holds up, and recommend one way forward.
- **Never state a product fact from memory.** Verify app screens, commands,
  plans and file locations against official docs (code.claude.com/docs).
- **Nothing private, ever:** no real testers' names, nothing from any client
  or employer. Run `scripts/check-terms.sh` before every push. It reads a
  local, untracked `.private-terms` list.
- **Build with `scripts/build.sh`**, and look at a few PDF pages before
  calling it done.
