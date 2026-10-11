# Installing the kit: instructions for the assistant

You're reading this because someone pasted the sentence from the README (or
the guide) into a session with an AI assistant (Claude Code, in the app or
a terminal, or Gemini CLI or Codex CLI in a terminal), asking you to fetch
this kit and follow this file. The kit's files say "Claude": if you're
another assistant, that means you. Your job: **make their first project folder from the
kit, then hand over to `/setup`.** Nothing else.

They are probably not technical. Use plain English, one step at a time, and
keep replies short. Before each permission request, say in one line what it's
for, especially anything **outside the folder this session was opened on**
(the kit lives in a hidden folder in their home folder, `.claude`, which
Claude Code always asks before writing to). If your file tools can't read
outside this folder, read this kit's files with the shell instead.

**On Windows,** PowerShell may pass `~` to git unexpanded. Use the full home
path in commands (`$HOME/.claude/workspace-kit`) rather than `~`.

## 1. Check the kit arrived

The kit should now be at `~/.claude/workspace-kit/`, and the blank project
template inside it at `~/.claude/workspace-kit/claude-workspace/`. Check that
`~/.claude/workspace-kit/claude-workspace/.claude/skills/setup/SKILL.md` exists.

- **It was already there, and is a git clone:** it was just updated with
  `git pull --ff-only`. If that failed (offline, or the saved kit was edited),
  say so in one line and carry on with the copy that's there. If the update
  changed any of the files that control what the assistant may do without
  asking (`git -C <kit> diff ORIG_HEAD HEAD -- claude-workspace/.claude/settings.json
  claude-workspace/.gemini claude-workspace/.geminiignore claude-workspace/.codex/rules`),
  stop and show them the change in plain English before going on.
- **It was already there, but isn't a git clone** (an older or unzipped copy):
  ask, then rename it to `workspace-kit-old-YYYY-MM-DD` (today's date) and
  clone afresh. Never delete it.
- **They used the ZIP** (some work laptops block downloads from GitHub): the
  kit should have been moved to `~/.claude/workspace-kit/` *before* this file
  was read. If it's still somewhere else, move it there first (the folder that
  holds this `INSTALL.md` and `claude-workspace/`; unzipping can nest it one
  level deeper). Don't open other files in it before it's moved.

## 2. Check where we are

This session should be open on their **Claude projects** folder: a folder in
their home folder that holds nothing, or only other project folders. Look
before doing anything. Stop and ask if it's:

- **already a project**: it has a `CLAUDE.md` or a `.claude` folder. Offer to
  make the new project next to it instead, and tell them how to open a session
  on the right folder;
- their home folder itself, or a folder full of unrelated things;
- inside Documents, Desktop, iCloud, OneDrive, Dropbox or Google Drive
  (syncing can scramble git snapshots). Suggest a **Claude projects** folder in
  their home folder instead, and how to open a new session on it;
- inside a git repository (`git rev-parse --show-toplevel` succeeds), including
  this kit's own folder.

## 3. Ask for a name

If project folders made from the kit are already here, they may have pasted
the sentence again by mistake. Ask: "Do you want a second project, or to open
<Name>?" If they want to open one, skip to step 5 for that folder.

Ask: **"What's your project? Give it a short name, like Bakery or My novel."**
Use it as the folder name. If a folder of that name already exists here,
never touch it: suggest another name.

## 4. Make the project folder

Copy `~/.claude/workspace-kit/claude-workspace/` to a new folder with that name
here. Include the hidden folders and files (`.claude`, `.gemini`, `.codex`,
`.gitignore`, `.geminiignore`). Then check, by
listing files or testing they exist, **without opening any file inside the new
folder** (opening one loads that project's rules into this session):

- `<new folder>/.claude/skills/setup/SKILL.md` and `<new folder>/.geminiignore`
  exist;
- there is **no** `.git` in the new folder. The project starts its own fresh
  history when `/setup` runs. Never clone this repository into a project
  folder, and never copy anything from outside `claude-workspace/`.

Don't run `git init`, and don't start setup here. If they type `/setup` in
this session, don't run it: setup has to run in a session opened on the
project folder itself, so it uses that folder's rules and settings.

## 5. Hand over

Tell them, in these words or close to them. **In the Claude app:**

> Your project folder is ready: **<full path>**. To start it:
> 1. Start a **+ New session** (Cmd+N on a Mac, Ctrl+N on Windows). A new
>    session is needed because Claude only reads a project's notes and rules
>    when the session is opened on that folder.
> 2. Set Environment to **Local**, choose **<Name>** as the project folder
>    (not *Claude projects*), and set Permission mode to **Manual**. If it asks
>    whether you trust the folder, say yes: it's your own.
> 3. Type **hello**. The reply should start "📁 You're in <Name>." Then type
>    **/setup**.
>
> For another project later, say "new project" inside any project, or paste
> the same sentence here again.

**In a terminal** (Claude Code, Gemini CLI or Codex CLI), with `<tool>` being
`claude`, `gemini` or `codex`:

> Your project folder is ready: **<full path>**. To start it, type `/exit`,
> then type `cd "<Name>"` and press Enter, then type
> `<tool>` and press Enter. (A fresh start is needed because I only read a
> project's notes and rules when I'm started in that folder.) If it asks
> whether to trust the folder, say yes: it's your own. Then say **hello**:
> the reply should start "📁 You're in <Name>." Then type **/setup**
> (with Codex, **$setup**).
>
> For another project later, say "new project" inside any project, or come
> back to this folder and paste the same sentence again.
