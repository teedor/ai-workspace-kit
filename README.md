# AI Workspace Kit

A starter kit and plain-English guide for working with an AI assistant as a
project partner that **remembers**: one folder per project, where the AI keeps
notes on where you're up to, what you've decided and why, and the next step,
and picks up where you left off every time.

It works for anything: a book, a business, a website, a family history, a
dissertation, a codebase.

> **Using the kit? Ignore the green Code button.** Follow "Start here"
> below: Claude gets the kit for you and makes your project its own folder.
> Already downloaded or cloned this? No harm done: just follow "Start here".
> **Improving the kit itself?** Clone as usual; `CLAUDE.md` is for you.

> **Status: early (v0.x).**
> Today it's built for **Claude Code** (the `claude-workspace/` kit).
> Support for other tools, such as GitHub Copilot CLI, is being explored.
>
> **Unofficial.** Not affiliated with or endorsed by Anthropic or GitHub.

## Start here

1. Install the Claude app from **claude.com/download** and sign in (a paid plan
   is needed). On Windows, also install Git from **git-scm.com** (the kit uses
   it for snapshots), then restart the app.
2. In your home folder, make an empty folder called **Claude projects**.
3. In the app, open the **Code** tab and start a new session on that folder
   (Environment: Local, Permission mode: Manual). Paste this (don't dictate it):
   > Set me up with the AI Workspace Kit: clone github.com/teedor/ai-workspace-kit into ~/.claude/workspace-kit (or update it if it's already there, deleting nothing), then follow its INSTALL.md; if Git is missing, stop and tell me how to install it.
4. Claude makes your first project folder and tells you how to open it and
   type `/setup`.

Only if your work laptop blocks Claude's download: use **Code → Download
ZIP**, unzip it in Downloads, and use the ZIP sentence in the guide's Step 3. The full
walkthrough is in the guide:
[`docs/Working with Claude - guide.pdf`](docs/) (source: `docs/guide.html`).

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
claude-workspace/   the kit: the blank template each project folder is copied from
INSTALL.md          what Claude follows to make the first project folder
docs/               the guide (HTML source and PDF)
scripts/            build the PDF; pre-publish checks
CLAUDE.md           instructions for AI sessions working on this repo
```

## Licence

MIT. See `LICENSE`.
