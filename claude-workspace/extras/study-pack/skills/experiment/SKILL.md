---
name: experiment
description: Plan an experiment before running it (with a written prediction), or record its results from the output files. Use when I say "let's try…", "I want to test whether…", "the run finished", "here are the results".
---

## Plan (before any run)

1. Take the next ID (`EXP-001`, `EXP-002`, …) and create `experiments/EXP-nnn-<name>/README.md`.
2. With me, fill in **before anything runs**:
   - the question, and the idea in `ideas/` it tests;
   - **my prediction, and what result would change my mind.** Written now,
     never edited afterwards;
   - dataset and version (e.g. a Hugging Face revision or a file hash), and the split;
   - which split is scored: validation, unless this is the `final` run;
   - the code commit (commit any changes first), the config file, and at
     least 3 seeds;
   - the baseline it's compared against;
   - where it'll run and roughly how long it'll take.
3. Run a quick check yourself (a small sample, a couple of minutes), then give
   me the exact command for the full run. I start it.
4. Add a row to `experiments/log.md`, and set the idea's status to `testing (EXP-nnn)`.

## Record (after a run)

1. Read the numbers **from the output files only** (`metrics.json`, logs).
   Never from my summary or your memory. Copy the small files into the
   experiment folder; big ones (checkpoints) stay where they are, with the
   path noted.
2. Report mean ± std across seeds, beside the baseline, and say plainly
   whether the gap is bigger than the spread.
3. Write "What it showed" against the prediction, with evidence tags.
4. Update the idea's status (`supported` / `not supported` / `inconclusive`),
   `experiments/log.md`, open questions, and the decisions log if we chose
   something because of it.
5. Keep failed and disappointing runs, with the reason. They belong in the write-up too.

## Running on Colab or another machine

Clone a specific commit of the project from a private GitHub repo (the token
goes in Colab Secrets, never in a cell). Save `run_info.txt` (commit, library
versions, GPU type), the config and `metrics.json` to Drive, then download
those small files into `inbox/` for me to record.
