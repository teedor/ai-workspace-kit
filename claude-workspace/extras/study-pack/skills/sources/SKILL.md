---
name: sources
description: Keep my reference list honest. Add a paper to the sources register, or check a draft's citations against it. Use when I mention a paper, a reference, citations, my bibliography or my literature review.
---

## Adding a source

When I drop a paper in the inbox or mention one:
1. Add a row to `literature/sources.md` with the full reference **taken from
   the paper itself or its DOI page**, never from memory. If you can't
   confirm it, mark it *(not known)*.
2. Set "Read" to **no**. Only I change it.
3. Instead of a summary that replaces reading it, give me **three questions
   to read it with**, tied to my project.
4. Create `literature/notes/<key>.md` with: `read-by:` (me / Claude only /
   abstract only), its main claims and numbers **with page numbers**, its
   method, data and limits, and a blank "How it relates to my project" for
   me to fill in. File the PDF in `literature/pdfs/<key>.pdf` (not in git,
   so remind me to keep it in Zotero or similar too).

## Checking a draft

When I ask you to check citations in a draft, report per citation, without
editing my text: whether it's in the register, whether I've marked it read,
whether the link works, and, if the PDF is in `literature/pdfs/`, whether
the cited page supports my sentence. Flag anything you can't confirm as *(not known)*.

## BibTeX

Keep `literature/references.bib` in step with the register (or use my
Zotero export), with entries built from the DOI, never from memory. For Word,
draft with `[@key]` placeholders and I'll insert citations with Zotero's plugin.
