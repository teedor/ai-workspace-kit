---
name: setup
description: Set up this project folder in about ten minutes, ending with one real piece of work. Everything optional is offered later, one thing at a time. Run once per project; run again to pick up where it left off or to add rules for assessed work.
disable-model-invocation: true
---

Set up this project folder. **Fast: about ten minutes, and it ends with one
real step done on the actual project.** Don't assume I'm technical: before
each step, say in one plain sentence what you're about to do, and **warn me
when the next permission prompt is for something outside this folder**, so I
know it's expected. One question at a time. I can answer by talking or typing.

## 0. Pick up where we left off

Setup is complete when `decisions/decisions-log.md` has a D1 that reads "Project set up". Example entries (DX1, DX2) don't count. If it is, ask
whether I want to change something (e.g. add rules for assessed work, step 4),
and do only that. Otherwise, resume from the first step below that isn't done.
It's fine to stop partway: say "Good place to stop; `/setup` picks up here."
whenever a step finishes.

## 1. Keep a copy of the kit for new projects (one line of warning, no question)

Usually already done: the install keeps the kit in `~/.claude/workspace-kit/`,
with the blank template in its `claude-workspace/` folder. Check
`~/.claude/workspace-kit/claude-workspace/.claude/skills/setup/SKILL.md` exists.
If it doesn't, **and** this folder holds nothing but the untouched kit, copy
**only** the kit's own files into `~/.claude/workspace-kit/claude-workspace/`,
keeping their paths: `CLAUDE.md`, `README.md`, `.gitignore`, `status.md`,
`handover.md`, `done.md`, `review-queue.md`, `.claude/settings.json`,
`.claude/skills/`, `.claude/agents/`, `extras/`, `notes/`, `ideas/`, `decisions/`,
`drafts/.gitkeep`, `finished/.gitkeep`, `inbox/README.md`,
`private/README.md`. (If the folder held a project before the kit arrived,
skip this; `/new-project` will fetch the kit instead.)

## 2. Git

Check `git --version` **first**: on a Mac it may pop up a box offering
"command line developer tools". If so: "Click Install, wait until it
finishes, then say done." On Windows, if git is missing, tell me how to
install Git for Windows, and wait.
- If `git rev-parse --show-toplevel` succeeds but names a different folder,
  this folder is inside another git repository: stop, tell me which one, and
  ask. Otherwise, if this folder isn't a git repository, `git init`.
- Check `git config --global user.name` / `user.email`. If set, show them in
  one line and carry on unless I object. If not, ask for them: any name and email are
  fine, since they're only labels on each snapshot (if I might back up to
  GitHub one day, it offers a private "noreply" email to use instead). Say
  this writes outside the folder, and set them with `--global`.
- **If the folder already held a project:** tell me briefly what you found.
  Don't overwrite anything: append the kit's `.gitignore` lines to the
  existing one, and show me changes to an existing `CLAUDE.md` or `README.md`
  before saving.
- Check `private/` and `inbox/` are ignored (`git check-ignore -v private inbox/x`).

## 3. This project

Suggest the folder name as the **Name** ("I'll call this Bakery: right?"),
then ask for one or two sentences on what it is and who it's
for, and whether it involves **code**. Write them into "This project" in
`CLAUDE.md` (fill in **Code in this project:** yes or no).

Then ask: **"Is this something new, or something you've been working on for
a while?"** Write **Started:** new, or already under way, under "This
project". Don't ask for any files yet: they come in at step 6, once the
rules and personal details are settled.

## 4. Rules for this work

Ask: **"Is this marked or assessed work, like coursework, a dissertation or a
qualification, or does an employer, publisher or client have rules about
using AI on it?"**
- **No:** write "None" under "Rules for this work" in `CLAUDE.md`.
- **Yes, and it's study or assessment:** install the study pack (follow
  `extras/study-pack/INSTALL.md`). Tell me in two lines what it changes: I
  write, Claude teaches and questions, and AI use is logged for my declaration.
- **Yes, other rules:** ask me to paste the rules or a link, save them as
  `notes/ai-policy.md`, and write a one-line summary under "Rules for this work".

## 5. Personal details and data

Ask with examples: **"Will anything here include real people's details or
data, like emails, orders, family records, spreadsheets, datasets about
people (posts, photos, health records, survey answers), recordings, or
anything covered by a licence, a contract or an ethics approval?"** Write the answer under "Personal details in this
project" in `CLAUDE.md`. If yes, note which kinds; that living people get more
care than the dead; that names, dates and places must be spelled exactly; and
that anything you read is sent to Anthropic, so licensed or restricted data
stays out of this folder unless its terms allow that.

## 6. One real step

**New work:** ask **"What's one small thing you could do on this right
now?"** If I don't know, offer one, such as copying the next deadline into
`status.md`, or dropping the project brief into the inbox. Help me do it.

**Work already under way:** the real step is catching up. Say:
"Copy (don't move) what you've got into the inbox folder, and keep your
originals where they are. Start with what matters most: the latest version,
the brief or plan, any deadlines, your own notes. Twenty or so files is a
good first batch; the rest can follow another day. Leave big folders,
datasets and code where they are: just tell me where they live." Mention
that a big batch uses a fair bit of the allowance. If the work is code that
already lives in its own repository, don't copy it in: suggest bringing the
kit into that repository instead (the guide's "Existing project?"), or
linking it later with the linked repos pack. Then run `/intake` in catch-up
mode.

Either way, add what we did to `done.md`.

## 7. Finish

- Delete the example rows in `review-queue.md` and `decisions/decisions-log.md`.
- Record D1: "Project set up", with today's date.
- Leave "Setup extras (optional)" in `status.md` as it is (each extra's
  instructions are there). They're offered later, one at a time, at the end
  of a session that went well. For reference:
  - **Check the fit** (`/tailor`), offered first: a fresh-eyes check of how
    this setup fits the work, with at most three changes, each only if I say yes.
  - **About me**: create or extend `~/.claude/CLAUDE.md` with who I am, the
    work I do, whether I mostly talk or type, whether I use Word, and anything
    you must never do. Write these as preferences that make sense in any
    folder. Never replace existing content, warn that it applies to every
    project, and show me the text first. Also list `~/.claude/skills/` and
    offer to rename any of this kit's skills that clash.
  - **Style guide**: from two or three samples (dropped in the inbox or
    pasted). For assessed work, the study pack's rules apply: use samples only
    to give feedback, never to write in my voice.
  - **Default critics** for `/red-team`.
  - **Dictation**: Mac, System Settings → Keyboard → Dictation, using the
    shortcut shown there; Windows, Windows key + H.
  - **Word export**: check you can make a `.docx`, and explain any install first.
  - **Make the allowance last** (Pro plan): suggest Sonnet as the everyday
    model, saved in my own settings (`~/.claude/settings.json`), never this
    project's. Offered straight away if I mention hitting my limit.
- Write `handover.md` with a proper First step (if the study pack set one, keep
  it and put the other steps under "Then"), then save a snapshot ("Starting point").
- End with: "You're set up. Next time: new session, choose this folder, say
  hello. For a different project, say 'new project'."
