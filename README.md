# AI Workspace Kit

A starter kit and plain-English guide for working with an AI assistant as a
project partner that **remembers**: one folder per project, where the AI keeps
notes on where you're up to, what you've decided and why, and the next step,
and picks up where you left off every time.

It works for anything: a book, a business, a website, a family history, a
dissertation, a codebase.

> **Using the kit? Ignore the green Code button.** Follow "Start here"
> below: your assistant gets the kit for you and makes your project its own
> folder. Already downloaded or cloned this? No harm done: just follow
> "Start here". **Improving the kit itself?** Clone as usual; `CLAUDE.md`
> is for you.

**Works with:** Claude Code (the Claude app, or a terminal), Gemini CLI,
and Codex (with a ChatGPT plan).

> **Status: early (v0.x).** Built and tested most with **Claude Code**. The
> Gemini CLI and Codex routes are new: tell us how they go.
>
> **Unofficial.** Not affiliated with or endorsed by Anthropic, Google,
> OpenAI or GitHub.

## Talk, in one place

The simplest way to use this is a **terminal window and your voice**. A
terminal is just a window where you say what you want and the assistant
does it. There are no menus to find, no buttons to learn, no settings
screens: you talk in one place, and the work happens. Turn on your
computer's own dictation (Mac: System Settings → Keyboard → Dictation, then
use the shortcut shown there; Windows: press Windows key + H), and talk.

It works the same whichever assistant you use, and it doesn't depend on any
app. If you'd rather click, the Claude app's Code tab works too.

## Start here

You need **Git** on Windows (from **git-scm.com**; Macs offer to install it
the first time it's needed), an empty folder called **Claude projects** in
your home folder (it's just a name), and one of these:

### Claude (the app or a terminal)

1. Get a paid Claude plan and install the app from **claude.com/download**.
   (For the terminal instead, see "Prefer the terminal?" in the guide.)
2. In the app, open the **Code** tab and start a new session on your Claude
   projects folder (Environment: Local, Permission mode: Manual).

### Gemini CLI

1. Install it: on a Mac with Homebrew, `brew install gemini-cli`; otherwise
   install Node.js (version 20 or later) from **nodejs.org**, then
   `npm install -g @google/gemini-cli`.
2. Open a terminal in your Claude projects folder and type `gemini`. Choose
   **Sign in with Google** and use a personal Google account (school and
   work accounts need extra Google Cloud set-up). Trust the folder when
   asked.
3. Free personal accounts: Google may use your prompts to improve its
   products, and people may read them. Type `/privacy` to choose.

### Codex (with a ChatGPT plan)

1. Install it. Mac: `curl -fsSL https://chatgpt.com/codex/install.sh | sh`
   (or `brew install --cask codex`). Windows, in PowerShell:
   `powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"`.
2. Open a terminal in your Claude projects folder and type `codex`. Choose
   **Sign in with ChatGPT** (Codex comes with Plus, Pro, Business, Edu and
   Enterprise plans), and choose **Trust and continue** when asked.
3. With Codex, the kit's commands start with `$` instead of `/`: `$setup`,
   `$start`, and so on.

### Then, whichever you chose

Paste this (don't dictate it: the web address has to be exact):

> Set me up with the AI Workspace Kit: clone github.com/teedor/ai-workspace-kit into ~/.claude/workspace-kit (or update it if it's already there, deleting nothing), then follow its INSTALL.md; if Git is missing, stop and tell me how to install it.

Your assistant makes your first project folder and tells you how to open it
and type `/setup`. Only if a work laptop blocks the download: use **Code →
Download ZIP**, unzip it in Downloads, and use the ZIP sentence in the
guide's Step 3.

The full walkthrough is in the guide:
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
- **Talk, don't type:** built for dictation, in a terminal or the app.
- **A study pack** for assessed work: you write, the AI teaches and
  questions, and AI use is logged for your declaration. It includes viva
  practice, an honest sources register and, for ML projects, an experiment log.

## Repository layout

```
claude-workspace/   the kit: the blank template each project folder is copied from
                    (CLAUDE.md and .claude/ for Claude Code; GEMINI.md, .gemini/
                    and .geminiignore adapt it for Gemini CLI)
INSTALL.md          what the assistant follows to make the first project folder
docs/               the guide (HTML source and PDF)
scripts/            build the PDF; pre-publish checks
CLAUDE.md           instructions for AI sessions working on this repo
```

## Licence

MIT. See `LICENSE`.
