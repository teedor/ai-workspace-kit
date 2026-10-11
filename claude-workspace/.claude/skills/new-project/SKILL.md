---
name: new-project
description: Start a separate project folder for a different piece of work, next to this one, with the same setup. Use when I say "new project", "start a new project", or "I want a separate folder for…".
---

Create a new, separate project folder.

**Why separate:** each project gets its own notes, decisions and inbox, so they
don't get muddled. Things true for all my work live in my global file and
global skills, which every project already shares.

**Is it really separate?** If I'm not sure, the test is: a different finished
product or a different audience means a new folder, even if it's related
(a bakery's day-to-day and its cookbook are two projects).

1. Ask what the new project is and what to call it.
2. **Get the latest kit.** It's kept in `~/.claude/workspace-kit/`, and the
   blank template is its `claude-workspace/` folder. Say in one line that this
   is outside this folder, then (on Windows, use the full home path rather
   than `~` in commands):
   - if it's a git clone, update it: `git -C ~/.claude/workspace-kit pull --ff-only`.
     If that fails (offline, say), tell me in one line and use the copy that's there.
     If the update changed `claude-workspace/.claude/settings.json`
     (`git diff ORIG_HEAD HEAD -- claude-workspace/.claude/settings.json`), stop
     and show me the change in plain English first: that file controls what
     Claude may do without asking;
   - if it's there but isn't a git clone (an older or unzipped copy), ask, then
     rename it to `workspace-kit-old-YYYY-MM-DD` and clone afresh. Never delete it;
   - if it's missing, clone it:
     `git clone https://github.com/teedor/ai-workspace-kit.git ~/.claude/workspace-kit`.
     If that's blocked, ask me to download the ZIP from that page (**Code →
     Download ZIP**), unzip it, and tell you where it is; move it to
     `~/.claude/workspace-kit/`.
3. **Work out where it goes.** Normally the same parent folder as this one
   (my "Claude projects" folder). If this folder's parent isn't called
   "Claude projects", or is inside Documents or Desktop (often cloud-synced),
   ask me where it should go. Don't put it inside a git repository. Tell me
   the full path and get my yes before creating anything. Never overwrite an
   existing folder.
4. Copy **only** `~/.claude/workspace-kit/claude-workspace/` there, including
   the hidden `.claude` folder and `.gitignore`. Check
   `.claude/skills/setup/SKILL.md` exists in the new folder and that it has
   no `.git` (it starts its own history in `/setup`).
5. **Carry anything across?** Ask whether the new project needs anything from
   this one (e.g. "copy my recipes and the style guide"). Copy only what I
   name, into the new folder's `notes/` or `inbox/`, and never anything from `private/`.
6. Tell me exactly how to open it:
   "Start a **+ New session** (Cmd+N on a Mac, Ctrl+N on Windows). Set
   Environment to **Local**, choose **<full path>** as the project folder, set
   Permission mode to **Manual**. Type hello: the reply should start
   '📁 You're in <name>'. Then type /setup. It already knows you, so it'll
   only ask about the new project."
