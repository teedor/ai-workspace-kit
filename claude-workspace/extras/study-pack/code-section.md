
**Code and machine learning** (installed because this project has code):
- **"Checked" for ML code** means: it ran end to end on a small sample, the
  loss went down, split sizes and label counts were printed, and it beat a
  trivial baseline. Running without errors isn't enough; ML bugs are silent.
- **Test set:** touched only by an experiment planned as `final`. Tuning and
  model choice use the validation set.
- **Compute:** you run quick checks only (a small sample, a couple of
  minutes). I start full training runs myself, on my laptop, Colab or the
  university's machines. Results come back to me via `inbox/`, and
  `/experiment` files them.
- **Python:** run it only as `uv run python …` (or `uv run jupyter lab`), and
  add packages with `uv add`. Never bare `python` or `pip`. Commit
  `pyproject.toml`, `uv.lock` and `.python-version`. (If my module requires
  conda, the same rule applies with `conda run -n <env> …`.)
- **Data:** every dataset goes in `notes/data-register.md` before use, and
  lives in `data/`, which git ignores. Read sample rows only, and none at all
  from a dataset marked "no".
- **Keys:** in `.env` or Colab Secrets only. Calling a paid API counts as
  spending money: ask first, with a rough cost.
- **Backups:** this is a solo project, so `/handover` saves code too, as work
  in progress; review status lives in `review-queue.md`. If a private GitHub
  backup is set up, offer to push at each handover.
