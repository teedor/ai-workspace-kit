---
name: intake
description: Process everything in inbox/. Read it, file it, note what was learned, archive the originals, and leave the folder empty. Use when I say "process the inbox", "sort the inbox", or that I've dropped something in.
---

Process everything in `inbox/`. I drop things in without sorting them. An empty
inbox is my signal that everything has been dealt with, so that signal has to be
trustworthy. Two rules always come first:

1. **Nothing is ever deleted.** Originals move to `private/archive/YYYY-MM-DD/`.
2. **Anything you can't fully process stays in `inbox/`**, and you tell me why.

## Steps

1. **List what's there** (name and type) before touching anything. If it's empty, say so and stop.
2. **Read everything.** Don't guess at a file's contents from its name.
   **Big things** (over 20 MB, or a folder of hundreds of files): don't read
   it all. Look at a sample, then ask me where it should live, and never put
   it in a folder git saves. Text,
   PDFs, and PNG/JPG images are straightforward. If you can't read something
   (an iPhone .heic photo, an audio file, a Pages or Keynote file), leave it in
   the inbox and tell me how to export it (as JPG, PDF or a transcript).
   Secret files (`.env`, `.pem`) are blocked from reading on purpose: tell me
   to move them out.
3. **Check for things that shouldn't be here.** Passwords and keys, and any
   personal details `CLAUDE.md` says this project doesn't hold, are **not
   filed**. Leave them where they are, tell me, and ask me to move them out of
   this folder.
4. **Decide where each thing belongs:**
   | It is… | It goes… |
   |---|---|
   | Confidential or personal notes | `private/` |
   | Facts, background, reference material | distilled into the right file in `notes/`, saying where each fact came from |
   | Published material I'll want to look back at (papers, manuals, guides) | kept, not archived: `notes/library/` (or `literature/` if the study pack is installed, via `/sources`) |
   | A dataset | its own folder that git ignores, plus a line in the data register if there is one. Ask me first. |
   | Something I want turned into a piece of work | a starting draft in `drafts/` (or, for code, a task in `status.md`), added to `review-queue.md` |
   | A half-formed idea | `ideas/`, using the `/idea` method |
   | A decision I've made | `decisions/decisions-log.md`, using the `/decide` method |
   | Samples of my work, or corrections | used to improve `notes/style-guide.md` |
   | An error message or bug report | a task in `status.md`, with the details in `notes/` |
5. **Answer what it answers.** If it settles something in `notes/open-questions.md`,
   mark it answered (don't delete it).
6. **Archive the originals** to `private/archive/YYYY-MM-DD/`.
7. **Keep a receipt** in `private/archive/INTAKE-LOG.md`: date, what arrived, what it became.
8. **Tell me:** what arrived, what changed as a result, what's still in the inbox and why,
   and anything I should look at myself.
