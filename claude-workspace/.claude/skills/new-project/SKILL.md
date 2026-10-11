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
2. **Find the blank kit** at `~/.claude/workspace-kit/`. If it isn't there, ask
   me where an unzipped copy of the kit is, or download it from
   github.com/teedor/ai-workspace-kit (its `claude-workspace` folder). If I have a
   newer copy of the kit than the saved one, offer to replace the saved kit first.
3. **Work out where it goes.** Normally the same parent folder as this one
   (my "Claude projects" folder). If this folder's parent isn't called
   "Claude projects", or is inside Documents or Desktop (often cloud-synced),
   ask me where it should go. Tell me the full path and get my yes before
   creating anything. Never overwrite an existing folder.
4. Copy the kit there, including the hidden `.claude` folder and `.gitignore`.
   Check `.claude/skills/setup/SKILL.md` exists in the new folder.
5. **Carry anything across?** Ask whether the new project needs anything from
   this one (e.g. "copy my recipes and the style guide"). Copy only what I
   name, into the new folder's `notes/` or `inbox/`, and never anything from `private/`.
6. Tell me exactly how to open it:
   "Start a **+ New session** (Cmd+N on a Mac, Ctrl+N on Windows). Set
   Environment to **Local**, choose **<full path>** as the project folder, set
   Permission mode to **Manual**, then type /setup. It already knows you, so
   it'll only ask about the new project."
