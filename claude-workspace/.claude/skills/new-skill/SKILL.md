---
name: new-skill
description: Turn something we just did into a reusable skill, and decide whether it belongs to this project or to all my projects. Use when I ask for a new skill, or say "can you remember how to do that", "save that as a command" or similar.
---

Make a new skill from what I've described, or from what we just did.

## When to offer (from `CLAUDE.md`)

I may not think to ask for a new skill, so watch for the moments:
- I've given you much the same instructions twice;
- something took several steps and worked really well ("perfect", "that's
  exactly it");
- I keep making the same correction.

When one happens, offer it in **one plain line** at a natural pause, without
jargon, e.g. *"Want me to remember how to do this, so next time you can just
say 'chase the supplier'?"* (The limits on offers in `CLAUDE.md` apply.) If I
say yes, or later say "remember how to do that", carry on below.

## 1. Decide where it lives, and tell me why in one line

| It's a **global** skill (all my projects) if… | It's a **project** skill (just this one) if… |
|---|---|
| it would make sense in any project I do | it depends on this project's files, characters, code, audience or folders |
| it's about how *I* like things done (my email style, my summary format) | it's about how *this project* is done |
| e.g. "turn rough notes into a polite email", "summarise a PDF on one page" | e.g. "write a back-cover blurb for a chapter", "run the tests and deploy the site" |

**When unsure, make it a project skill.** It's easy to promote later and
harder to untangle a global skill that only fits one project. A global skill
also **takes priority over** a project skill with the same name in *every*
project. Before creating it, check no skill with that name exists here, in
`~/.claude/skills/`, in the other project folders next to this one, or as a
built-in command (like `/resume`, `/review`, `/help`); if one does, pick another name.
You decide the scope; tell me which you chose and why, in one line.

- **Project skill:** `.claude/skills/<name>/SKILL.md` in this folder.
- **Global skill:** `~/.claude/skills/<name>/SKILL.md` in my home folder.

## 2. Write it

- A short name, lower-case, hyphens for spaces.
- A `description` line saying what it does and **when to use it**, including
  the everyday phrases I'd actually say, since I mostly dictate.
- Numbered steps in plain English, built from what actually worked, including
  any corrections I made along the way.
- A global skill mustn't assume this project's folders exist. If it uses
  `notes/style-guide.md` or similar, it says "if there is one".
- If it has side effects (sends, deletes, commits, publishes, spends), add
  `disable-model-invocation: true` so it only runs when I ask for it by name.

## 3. Show me, then save

Show me the skill and where it'll go. Save when I say yes. Then ask me to
type `/` and check it's in the list. (If it was the very first global skill,
it may only appear in a new session.) If it still doesn't show up, offer to
make it a project skill instead. For a project skill, record it
with `/decide` ("Added skill /<name>"). For a global skill, add a line to a
"My global skills" list in `~/.claude/CLAUDE.md` instead. Then tell me how to use it in
one line.

To **promote** a project skill to global later: move its folder to
`~/.claude/skills/`, remove anything project-specific, and tell me.
