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

## Is this for you?

It depends on the shape of the work, not the subject or who you are.

**A good fit:** work that runs over weeks or months, that you come back to
in fits and starts, that lives in files on a computer, and that needs to be
right.

**Less of a fit:** quick questions; shared online documents others edit at
the same time (Google Docs, Teams); work done mostly on a phone or tablet;
pupils', patients' or clients' details on a personal account.

**Or the chat apps' Projects?** The Claude and ChatGPT chat apps both have
Projects that keep your instructions and files, with no setup beyond naming
one. If that's all you need, start there, or use both. This kit adds memory
you own (ordinary files in your folder, with no export step), a ready-made
next step even after weeks away, decisions kept with their reasons, saved
versions to go back to, and an assistant that files what you drop in, marks
what it checked, and queues its work for your sign-off.

**The price:** a paid plan (Claude Pro or above, or a ChatGPT plan that
includes Codex; Gemini CLI works with a free Google account), a computer, a
little typed setup, and saying yes when the assistant asks before changing
things.

## Talk, in one place

Once it's installed, the simplest way to use this is a **terminal window
and your voice**. A terminal is just a window where you say what you want
and the assistant does it. There are no menus to find, no buttons to learn,
no settings screens: you talk in one place, and the work happens.

Use a proper dictation app rather than your computer's built-in one,
which cuts out after a pause and isn't made for fast, rambling talk. Hold a
key, talk as fast as you like, let go, and the text appears.
- **Easiest, in Claude Code:** once it's running, type `/voice`. From then
  on, holding Space records you instead of typing spaces. Nothing to install.
- **Wispr Flow** (wisprflow.ai): the most polished, and it tidies away the
  "ums". Works in any app. Mac, Windows, phones. Free for 2,000 words a week
  on a computer. It works online: in its settings, turn off the option that
  lets it learn from your recordings (Privacy Mode).
- **Handy** (handy.computer): free, and turns your voice into text on your
  own computer. Mac, Windows, Linux.

Whichever you use, what you say still reaches the assistant's company as
text: check your school's or employer's rules before talking about pupils,
patients or clients. Can't install apps on a work laptop? The built-in one
(Windows key + H, or Dictation in the Mac's Keyboard settings) will do to
start. The guide has more; if one doesn't work in your terminal, tell us.

It works the same whichever assistant you use. Installing takes a few typed
commands the first time; we give you each one exactly. With ChatGPT or
Gemini, the terminal is the way in; with Claude, if you'd rather click, the
Claude app's Code tab works too.

## Start here

**Use whichever you already have:**
- **Claude** (Pro or above): the Claude app, or Claude Code in a terminal
- **ChatGPT** (Plus or above): Codex, in a terminal
- **A Google account** (free is fine): Gemini CLI, in a terminal

**First, on Windows only:** install Git from **git-scm.com** (click **Next**
on every screen; the defaults are right). Macs offer to install it the
first time it's needed.

**Then make your projects folder.** Windows: open File Explorer, click the
address bar, type `%USERPROFILE%` and press Enter. Mac: in Finder, choose
**Go → Home**. Make a new folder there called **Claude projects** and leave
it empty. (It's just a label: keep the name even with ChatGPT or Gemini,
because the setup looks for it.)

**To open a terminal in that folder:** Windows: open it in File Explorer,
click the address bar, type `powershell` and press Enter. Mac: open
**Terminal** (press Cmd + Space, type Terminal, press Enter), type `cd`
and a space, drag the folder into the window, and press Enter.

> **School or work laptop?** If an install is blocked, or asks for an
> administrator password you don't have, stop and use your own computer or
> ask IT. And
> never bring pupils', patients' or clients' details into a personal AI
> account: check your employer's rules first.

Then pick one:

### If you have Claude

You need a paid Claude plan (Pro or above). Then either:
- **In a terminal:** install Claude Code. Mac: `curl -fsSL https://claude.ai/install.sh | bash`.
  Windows: `irm https://claude.ai/install.ps1 | iex`. Close the terminal,
  open a new one in your Claude projects folder, and type `claude` (it opens
  your browser to sign in the first time).
- **Or in the app:** install it from **claude.com/download**, open the
  **Code** tab, and start a new session on your Claude projects folder
  (Environment: Local, Permission mode: Manual).

### If you have ChatGPT: Codex

1. Install it. Mac: `curl -fsSL https://chatgpt.com/codex/install.sh | sh`
   (or `brew install --cask codex`). Windows, in a terminal
   (see above): `powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"`.
   Then close the terminal and open a new one.
2. Open a terminal in your Claude projects folder and type `codex`. Choose
   **Sign in with ChatGPT** (Codex comes with Plus, Pro, Business, Edu and
   Enterprise plans), and choose **Trust and continue** when asked. On
   Windows, Codex then offers to set up its sandbox: choose **Set up default
   sandbox** and say yes to the Windows box that follows. That one
   administrator prompt is expected.
3. In ChatGPT's settings, check whether OpenAI may use your conversations
   to improve its models, and turn that off if you'd rather it didn't.
4. With Codex, the kit's commands start with `$` instead of `/`: `$setup`,
   `$start`, and so on. Codex will ask before downloading the kit into a
   hidden folder: say yes.

### If you have a Google account: Gemini CLI

1. Install it: on a Mac with Homebrew, `brew install gemini-cli`; otherwise
   install Node.js (version 20 or later) from **nodejs.org**, then
   `npm install -g @google/gemini-cli`. Then close the terminal and open a
   new one.
2. Open a terminal in your Claude projects folder and type `gemini`. Choose
   **Sign in with Google** and use a personal Google account (school and
   work accounts need extra Google Cloud set-up). Trust the folder when
   asked, and in your project folder later, choose **Acknowledge and
   Enable** when it asks about new agents.
3. Free personal accounts: Google may use your prompts to improve its
   products, and people may read them. Type `/privacy` to choose.

### Then, whichever you chose

Paste this (don't dictate it: the web address has to be exact):

> Set me up with the AI Workspace Kit: clone github.com/teedor/ai-workspace-kit into ~/.claude/workspace-kit (on Windows use $HOME instead of ~), or update it if it's already there, deleting nothing. Then read its INSTALL.md (with the shell if your file tools can't reach it) and follow it. If Git is missing, stop and tell me how to install it.

Your assistant makes your first project folder and tells you how to open it
and type `/setup`. **Next time:** in a terminal, open one in your project's
folder (not Claude projects), start `claude`, `gemini` or `codex`, and say
hello; in the Claude app, start a new session on your project's folder.

Only if a work laptop blocks the download: use the green **Code → Download
ZIP** button (this is the one time you need it), unzip it in Downloads, and
use the ZIP sentence in the guide's Step 3.

The full walkthrough is in the guide:
[`docs/Working with Claude - guide.pdf`](docs/Working%20with%20Claude%20-%20guide.pdf) (source: `docs/guide.html`).

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
- **A build pack** for software: a list of what it must do (from a brief, a
  board export or by talking), one stage planned at a time, checks written
  before the code, and a fresh critic checking each stage against the list.

## Repository layout

```
claude-workspace/   the kit: the blank template each project folder is copied from
                    (CLAUDE.md and .claude/ for Claude Code; GEMINI.md, .gemini/
                    and .geminiignore for Gemini CLI; AGENTS.md and .codex/
                    for Codex)
INSTALL.md          what the assistant follows to make the first project folder
claude-workspace/extras/  optional packs: study, visuals, linked repos, build
docs/               the guide (HTML source and PDF), the Copilot CLI plan, and
                    the build pack's design notes
scripts/            build the PDF; pre-publish checks
CLAUDE.md           instructions for AI sessions working on this repo
```

## Licence

MIT. See `LICENSE`.
