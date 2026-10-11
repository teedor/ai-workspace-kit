# AI Workspace Kit

A starter kit and plain-English guide for working with an AI assistant as a
project partner that **remembers**: one folder per project, where the AI keeps
notes on where you're up to, what you've decided and why, and the next step,
and picks up where you left off every time.

It works for anything: a book, a business, a website, a family history, a
dissertation, a codebase.

> **Status: early (v0.x).**
> Today it's built for **Claude Code** (the `claude-workspace/` kit).
> Support for other tools, such as GitHub Copilot CLI, is being explored.
>
> **Unofficial.** Not affiliated with or endorsed by Anthropic or GitHub.

## Start here

1. Read the guide: [`docs/Working with Claude - guide.pdf`](docs/) (the source is `docs/guide.html`).
2. Get the kit: download this repository (**Code → Download ZIP**) and use the
   `claude-workspace` folder inside it, or the zip attached to the latest Release.
3. Follow Part 1 of the guide. Setup takes about ten minutes once the app is
   installed, and ends with one real piece of work done.

## What's in it

- **An inbox:** drop anything in, unsorted; the AI files it and the folder empties.
- **A handover:** every session ends with one small, ready-to-go next step, so
  starting again is easy. Closing the window is a fine way to stop.
- **A rhythm it learns:** sessions are as long as they turn out to be; no
  streaks, no guilt, a "low day" option.
- **Decisions and ideas:** decisions are recorded with why, and never deleted
  when replaced; ideas carry the case against them and a test.
- **Red-teaming:** independent critics with fresh eyes pick holes before
  anyone else does.
- **Talk, don't type:** built for dictation.
- **A study pack** for assessed work: you write, the AI teaches and
  questions, and AI use is logged for your declaration. It includes viva
  practice, an honest sources register and, for ML projects, an experiment log.

## Repository layout

```
claude-workspace/   the kit: unzip, rename after your project, open, /setup
docs/               the guide (HTML source and PDF)
scripts/            build the PDF and release zip; pre-publish checks
CLAUDE.md           instructions for AI sessions working on this repo
```

## Licence

MIT. See `LICENSE`.
