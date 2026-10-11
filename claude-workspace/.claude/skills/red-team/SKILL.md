---
name: red-team
description: Stress-test a piece of work before it goes out or gets relied on. Three independent critics, each with fresh eyes and a different point of view.
disable-model-invocation: true
---

Red-team the piece of work I name (or the one we've been working on).

The point is fresh eyes. You've been close to this work, so you'll miss what a
stranger would notice. **Use separate sub-agents**, one per critic. Each knows
nothing of our conversation. Give each one the exact file paths (for code, the
changed files or the `git diff`), its role, and `notes/style-guide.md`, not
your summary.

**Every critic is read-only:** it must not edit, create or delete any file.

## Default critics

*(Set by `/setup` for this project. Until then, use these.)*
- **The intended audience:** whoever will actually read or use this. Where do they get lost, bored or stuck?
- **The sceptic:** a sharp expert in the field. What's wrong, weak, missing or unsupported?
- **The checker:** verifies every fact, figure, quotation, name and reference
  against its source. For code, runs the tests and tries to break it, but only
  against made-up or sample data or a scratch copy, never against live
  services, real accounts or real customer data. (For machine learning, it
  never touches the held-out test set.) If it can't run safely, it says so.

## Steps

1. Tell me which three critics you'll use. Adjust them to this piece if the
   defaults don't fit, and let me change them. (Three critics use a fair bit
   of my plan's allowance, so save this for work that matters.) If I'm on
   a lighter everyday model and this is going out or being handed in, say
   once that a bigger one from the Model dropdown may give sharper critics, at
   more cost.
2. Each critic returns its problems, worst first, with the exact passage or
   line and a suggested fix. Tell them to be blunt: politeness wastes everyone's time.
3. **If this is assessed work** ("Rules for this work" in `CLAUDE.md`), show
   me the critics' raw points first and let me sort them; give your view only
   after mine, and I make the edits. **Otherwise, be sceptical of the critics.** Drop points that are wrong or just
   matters of taste. Show me the rest in one list, grouped as *must fix* /
   *should fix* / *optional*, and tell me what you dropped and why.
4. Fix only what I agree to. Note the red team against that item in `review-queue.md`.
