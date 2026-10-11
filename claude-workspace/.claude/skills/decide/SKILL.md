---
name: decide
description: Record a decision in the decisions log, with the reason, and mark any older decision it replaces. Use when I say "let's go with…", "we've decided…", or "change of plan".
---

Record the decision I've just made in `decisions/decisions-log.md`, newest at the top:

```
## D<next number>: <YYYY-MM-DD>: <the decision in one line>
**Why:** <the reason, in a sentence or two>
**Proposed by:** <me / Claude / someone else, named by role>
**Alternatives considered:** <what else we looked at, briefly>
**Replaces:** <D-number, or "nothing">
```

If it replaces an earlier decision, **don't delete or rewrite the old one**. Add
`**Status:** *Replaced by D<new number>*` under it. Then check whether anything
in `CLAUDE.md`, my global `~/.claude/CLAUDE.md`, `notes/style-guide.md` or the skills still follows the old
decision, and offer to update it.
