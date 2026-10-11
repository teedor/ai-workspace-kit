# Study pack

For marked or assessed work: a dissertation, final-year project, coursework or
a professional qualification. `/setup` installs it when you say the work is
assessed. It isn't loaded otherwise.

**The idea in one line:** you write, Claude teaches and questions, and every
use of AI is logged, so your declaration is easy and honest and your process
is on record.

**Your university's rules come first.** Policies differ between institutions
and between modules. Read yours, put it in `notes/ai-policy.md`, and agree
with your supervisor what's allowed, ideally at your first meeting. Show them
the "Rules for this work" section of `CLAUDE.md`.

**What it adds:** rules for assessed work (in `CLAUDE.md`), an AI-use log, a
sources register with per-paper notes, a data register, a marking-scheme page,
`/explain-back` (viva practice) and `/sources`. For projects with code, it
also adds an experiment log, `/experiment` and ML-specific rules.

**Tips**
- **Overleaf:** if your university gives you Overleaf's git integration,
  clone the project into `dissertation/overleaf/` (git ignores it; Overleaf
  is its backup). Otherwise, keep writing in Overleaf and paste in.
- **Word:** draft with `[@key]` citation placeholders, then insert real
  citations with Zotero's Word plugin.
- **Colab:** see "Running on Colab" in the `/experiment` skill. Keys go in
  Colab Secrets, never in a cell.
- Claude Code may add a "Co-Authored-By: Claude" line to commits it makes.
  Leave it: it's honest, and it supports your declaration.
