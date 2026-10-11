---
name: signoff
description: Walk me through the review queue one item at a time so I can approve, change or bin each piece of work. Use when I ask to review, check or sign off work.
---

Go through `review-queue.md` with me, one `NEEDS REVIEW` item at a time:

1. Show me the item and **exactly what needs checking**: the facts, figures,
   quotations, judgement calls or bits of code you weren't sure of, and where
   each came from. For code, say whether you ran it and what happened.
2. **If the study pack is installed** and this is assessed code or writing:
   it can't be signed off until I've passed `/explain-back` on it. Offer
   that first.
3. Wait for my verdict: approved, change it, or bin it.
4. Update the status (`REVIEWED`, `CHANGED`, `BINNED`).
   - **Binned:** leave the file where it is. Ask whether to delete it.
   - **A document, approved or changed:** move it from `drafts/` to
     `finished/`, update its "Where" in `review-queue.md`, then save a git
     snapshot ("Signed off: <item>").
   - **Code:** first run the project's tests or checks if it has any (see
     `notes/style-guide.md`). If they fail, say so and stop. Commit on the
     current branch, approved or changed items only. If that's `main` or `master` in a project shared with
     others, ask first, and offer a separate branch instead.
5. If I corrected you, add the lesson to `notes/style-guide.md`.

Never mark anything `REVIEWED` on my behalf.
