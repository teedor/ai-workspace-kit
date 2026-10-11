# Notes for Gemini CLI

*(This file is for Gemini CLI only. Any other assistant reading it: ignore
it.)*

This workspace's rules are in `CLAUDE.md`, written for Claude. You're Gemini
CLI: wherever the kit says "Claude", it means you. Follow them as written,
with the differences below.

@./CLAUDE.md

## What's different for you

- **Skills.** The kit's skills are in `.claude/skills/<name>/SKILL.md`, and
  each has a slash command here (`/start`, `/handover`, `/intake` …). When I
  ask in my own words for something a skill covers (each file's
  `description` says when), read that file and follow it. `/setup` and
  `/red-team` only run when I type them. Phrases to skills: hello or "carry
  on" → start; "that's it for today" → handover; "process the inbox" or
  "catch up on this" → intake; "I've had an idea" → idea; "let's go with…" →
  decide; "make it plainer" → plain; "let's sign things off" → signoff; "I've
  got a meeting" → meeting; "check the fit" → tailor; "new project" →
  new-project; "remember how to do that" → new-skill.
- **Critics.** Where a skill says to use the `critic` sub-agent, use
  `@critic` (in `.gemini/agents/`), one per critic. It can only read.
- **My global file** is `~/.gemini/GEMINI.md` wherever the kit says
  `~/.claude/CLAUDE.md`, and my personal skills go in `~/.gemini/skills/`
  wherever it says `~/.claude/skills/`. The same rules apply: never replace
  what's there, warn that it covers every project, and show me the text
  first.
- **Where my words go.** What you read is sent to Google, not Anthropic:
  say "Google" wherever the kit says "Anthropic". If I signed in with a free
  personal Google account, Google may use my prompts to improve its
  products, and people may read them, unless I turn that off with
  `/privacy`. Tell me this once during `/setup` (at the personal details
  question), and again before I bring in other people's personal details.
- **Guard rails.** `.claude/settings.json` doesn't apply to you. You ask me
  before edits and commands anyway, unless I've changed your approval mode;
  keep to rule 8 yourself. `.geminiignore` stops your file tool reading
  `.env`, `.pem` and key files; your shell could still read them, so never
  try. Never run `env`, `printenv` or `set`, or print a variable, since
  this folder's `.env` may be loaded into your environment. If `.env` has
  a `GEMINI_API_KEY=` line (from an older version of the pictures pack),
  tell me once to rename it to `GEMINI_IMAGE_KEY=` myself: that name could
  switch your sign-in to billing that key.
- **Trusting this folder.** This folder's settings (`.gemini/settings.json`,
  which lets you read `inbox/` and `private/`) and its commands only work
  once I've trusted it. If you can't read the inbox, or `/start` is
  missing, tell me to type `/permissions trust`, then press **r** to
  restart. The first time, Gemini also asks about new agents: tell me to
  choose **Acknowledge and Enable**, or `@critic` won't load.
- **Setup extras.** "Make the allowance last" is for Claude plans: skip it.
  Instead, if I mention running out, tell me `/stats model` shows today's
  limits and `/model` chooses the model.
- **Packs.** The linked repos pack is for Claude Code only, for now. The
  visuals pack's diagrams work as written; its picture script uses its own
  key in this folder's `.env`, separate from how you sign in.
- **My computer.** If you aren't told which system I'm on, ask once (setup
  step 2 records it).
