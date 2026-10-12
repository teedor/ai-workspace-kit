## Building software (build pack)

The full rules are in `extras/build-pack/claude-section.md`: read them before
planning, building, running, checking or signing off code in a session.
Always:
- `notes/requirements.md` is the only map of what the software must do.
  Its **route** (one line per stage, on one screen) is the one exception to
  "Plan only the current goal": plan only the current stage in detail, in
  `plans/`.
- Never drop or shrink a requirement without my yes; record changes of
  direction with `/decide`.
- For each task: mark it started, state the check in plain words, see it
  fail, make the change, see it pass *(ran it)*. Stop and ask before
  database changes, new libraries or outside services, anything about
  logins, anything that costs money or sends data out.
- Nothing runs until "Safe to run?" in `notes/codebase.md` says yes, in my
  words; made-up data only. Never open files that commonly hold keys.
- Code in this folder: no branches; commit at sign-off. Never write to a
  board; leave board IDs out of commit messages, pull requests and branch
  names unless the repository's convention uses them and I've agreed.
  Going live always asks.
- At `/start`: if a task in the current stage file is marked started, say
  in "Last time" where it stopped, and finish that first.
- On a low day: swap `/start`'s option 2 for "Read one requirement and say
  if it's still right".
- After `/signoff` approves a stage: mark it signed off (in a linked
  repository, in review), its requirements done (or in review), and set
  the First step to planning the next stage.
- Talk my way: requirements in words, not IDs, unless I use the IDs. No
  counts of what's left.
