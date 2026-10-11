---
name: handover
description: End a session with a quick tidy-up so the next one can start cold, then save a snapshot. Use when I say I'm stopping, e.g. "that's it for today", "let's wrap up", "I'm done", "stop there".
---

Wrap up quickly. **Ask me nothing.** Anything that needs my decision goes
under "Open threads" as a question for next time.

1. **Update `status.md`:** current goal and its next steps, waiting on, dates.
   Replace old information rather than adding below it. (`done.md` keeps the
   record of what's finished; don't touch past entries.)
2. **Rewrite `handover.md`**, keeping the quoted line at the top unchanged:
   - **Written:** today's date
   - **First step:** see below. Always the first thing under "Next session".
   - **Then:** up to three more steps
   - **Where we are:** two or three lines, true today
   - **Open threads:** questions for me, and anything waiting on someone else
   - **Last session:** two or three lines. Replace the old entry.

   **The First step** is one action that starts with a verb, names the exact
   file and place, needs no decisions, and fits comfortably inside a short
   session. Someone tired should be able to do it without reading anything else.
   - Good: "Open `report/ch2-method.md`, go to the end, and write the sentence
     on why you used 5-fold CV (your note: small dataset)."
   - Bad: "Continue the methods chapter."
   - For code: a named failing test, or the next function's name and what it
     should return.
   - **If I stopped mid-task, don't round it off.** Record exactly where I
     was and what I was about to do. That's the easiest place to restart.
3. **Learn my rhythm.** From the times in `git log` and this session, note
   roughly how long it ran. Keep "How I tend to work" in `status.md` up to
   date: typical session length, longer days, time of day if there's a
   pattern. Use it to size the First step and the next steps. It's a
   description, never a target: no streaks, no averages to beat.
4. Check `review-queue.md` lists anything produced today.
   **If the study pack is installed** ("Rules for this work" in `CLAUDE.md`):
   add today's line to `notes/ai-use-log.md`, honestly, including anything
   you wrote or I asked you to write. If the project keeps a logbook, end
   step 7 with my one question, "What did you learn, and what's stuck?", and
   record whatever I say next, word for word, in `logbook/YYYY-MM-DD.md`.
   No answer is fine.
5. **Save a snapshot in git.** Check first. Plain `git status` hides what's
   inside new folders, so use `git status --untracked-files=all` and these:
   - big files (over 20 MB): `git ls-files -z --others --modified --exclude-standard | xargs -0 du -k /dev/null | awk '$1 > 20480'`
   - lots of new files (over 300 usually means a dataset, a photo dump or a
     program's working folder): `git ls-files --others --exclude-standard | wc -l`
   - keys written into files: `git grep --untracked -nIE "(^|[^A-Za-z0-9])(sk-[A-Za-z0-9_-]{20,}|sk_live_|hf_[A-Za-z0-9]{30,}|gh[pousr]_[A-Za-z0-9]{30,}|github_pat_|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{30,})|wandb\.login\(key|(api_key|secret|password|token) *= *[\"'][A-Za-z0-9_-]{12,}[\"']"`

   (On Windows without Git Bash, do the same checks another way.) If any
   check finds something, **don't save those files**: add big data or model
   folders to `.gitignore`, and put the rest under Open threads in one line
   each. Never save something big "just this once": it stays in the history
   for good, and GitHub refuses files over 100 MB. Personal details this
   project isn't meant to hold: same treatment.
   - Read **Code in this project** in `CLAUDE.md`. If it's missing, treat the
     project as having code, and add the question to Open threads.
   - **No code in this project:** save everything else with a one-line
     description of the session.
   - **Code in this project:** save the workspace files by name (`CLAUDE.md
     README.md .gitignore status.md handover.md done.md review-queue.md notes
     ideas decisions drafts finished .claude/skills .claude/settings.json`,
     plus any folders the study pack added: `experiments literature logbook`).
     List other changed files under Open threads ("uncommitted: src/train.py.
     Sign off, or keep going?"). `/signoff` commits reviewed code.
   - Never skip the project's checks (`--no-verify`). If a check fails, note it.
6. **Optional, one line, needs no answer:** if the session went well and
   something was repeated or worked brilliantly, mention it for next time,
   e.g. "Next time, say 'remember how to do that' if you'd like me to keep it."
   Skip it if you've already offered something this session, if it's in
   "Declined suggestions", or if nothing stands out.
7. End with one line: "Saved. Next time: <First step>."
