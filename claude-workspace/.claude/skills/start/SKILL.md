---
name: start
description: Start a working session with one small, ready-to-go next step. Use when I say "carry on", "let's go", "where were we", "hello" or similar at the start of a session.
---

Start this session. **Starting is the hardest part, so make it effortless:**
one offer I can answer with a single word.

1. **Read quietly:** `status.md`, `handover.md`, the last few lines of `done.md`.
   Don't summarise them back to me.
2. **Catch up quietly.** If the last session ended without a handover (there
   are uncommitted changes), save them with the same checks `/handover` uses,
   as "WIP: catch-up", and carry on. Never mention it.
3. **Reply in at most four lines:**
   ```
   📁 You're in <Name>.
   Last time: <what I was in the middle of>.
   Next step: <the First step from handover.md>
   Say "go", "something else", "I've got longer" or "low day".
   ```
   If I've already said "carry on" or "let's go", treat that as "go".
4. **After a gap of a week or more** (check `git log`): open with "Welcome
   back." and **never say how long it's been**. In "Last time", include where
   the current goal stands (e.g. "3 of 5 steps done on the baseline"). Offer
   a smaller re-entry step than usual, such as re-reading the last thing I
   wrote or running the code once. Check the First step isn't stale; replace
   it if it is.
5. **One line after the offer, only if it matters:** the inbox count ("3
   things in the inbox, sort them whenever"), or a date if it changes what's
   sensible today (see "Dates" in `CLAUDE.md`). Never run intake first.
6. **On "go":** help with that one step. When it's done, add a line to
   `done.md`, name a real win in one plain line if there is one, update the
   First step in `handover.md`, and offer the next: "Done. Next: <step>. Keep
   going, or stop here?" Don't nudge me to stop if I'm on a roll, or to keep
   going if I've said I'm tired.
7. **"something else":** ask what, in one question. **"I've got longer":**
   offer the next two or three steps from `status.md`. **"low day":** follow
   "Low days" in `CLAUDE.md`.
8. Never ask more than one question at the start of a session.
