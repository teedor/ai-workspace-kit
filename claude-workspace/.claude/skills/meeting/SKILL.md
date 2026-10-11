---
name: meeting
description: Prepare for a meeting (a one-page update and my questions) or file notes afterwards (actions, dates, decisions). Use when I mention a meeting with a supervisor, manager, client, editor or anyone I report to, e.g. "I've got a meeting tomorrow", "here are my notes from the meeting".
---

## Before a meeting

Build a one-page update from `done.md`, `status.md`, `decisions/` and
`git log` since the last meeting:
- what's been done (short, concrete)
- what's blocking me
- decisions I'd like their view on
- my questions. Ask me for them, and keep them in my words.
- the next date that matters

Save it as `notes/meetings/YYYY-MM-DD-<who>-prep.md`. Keep it to one page. It's
for me to talk from, not to read out.

## After a meeting

I'll usually dictate notes. File them **faithfully**: fix mis-heard words
only, don't tidy or reinterpret. Save as `notes/meetings/YYYY-MM-DD-<who>.md`. Then:
- actions go into `status.md`, each with who and when (a date only if one was
  actually said);
- anything agreed goes through `/decide`, marked "agreed with <who>";
- new dates go under "Dates" in `status.md`, with this meeting as the source.

Tell me in three lines what you filed where.
