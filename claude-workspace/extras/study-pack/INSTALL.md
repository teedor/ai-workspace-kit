# Installing the study pack (Claude follows this from /setup)

Keep it quick: one question at a time, and anything not needed today becomes
an item under "Setup extras (optional)" in `status.md`.

1. **Rules.** Put `claude-section.md` under "Rules for this work" in this
   folder's `CLAUDE.md`, replacing the placeholder.
2. **Skills.** Copy `skills/explain-back` and `skills/sources` into
   `.claude/skills/`.
3. **Files.** Copy `files/notes/*` and `files/literature/` into the folder,
   keeping paths. Never overwrite existing files.
4. **Code?** Check **Code in this project** in `CLAUDE.md`. If yes:
   - append `code-section.md` to "Rules for this work";
   - copy `skills/experiment` into `.claude/skills/` and `files/experiments/`
     into the folder; create `data/README.md` pointing to `notes/data-register.md`;
   - check `uv --version`. If uv is missing, add "Install uv" to Setup extras;
   - set `/red-team`'s default critics to: **second marker** (marks against
     `notes/marking-scheme.md`: where are marks lost, is every claim backed by
     a citation or an EXP-nnn); **evaluation auditor** (read-only: no leakage
     between splits, preprocessing fitted on training data only, test set
     used once, trivial and published baselines, a metric that suits the
     class balance, 3+ seeds as mean ± std, equal tuning budgets, claims
     match the numbers); **viva examiner** (questions only).

   If no: set the critics to second marker, viva examiner, and a checker for
   sources and numbers.
4a. **Logbook?** Ask whether the module needs a logbook or reflections. Write
   `**Logbook:** yes` or `no` under "Rules for this work".
5. **.gitignore.** Append `gitignore-additions.txt` (the code sections only if
   the project has code).
6. **Global line.** Warn that this writes outside the folder, then add to
   `~/.claude/CLAUDE.md` (create it if needed, never replace content): "I'm a
   student. For assessed work I write and Claude teaches and questions, and
   AI use is logged in that project's `notes/ai-use-log.md`."
7. **Make the First step** "Fill in `notes/ai-policy.md` from the module
   handbook (a paste or a link is fine)". Add these to Setup extras: hand-in
   dates (with sources) into `status.md`; the marking scheme; Overleaf or
   Word; where training runs (laptop, Colab, university machines). Never
   guess any of them.
8. Tell me in two lines what changed, and that my supervisor should see the
   "Rules for this work" section.
