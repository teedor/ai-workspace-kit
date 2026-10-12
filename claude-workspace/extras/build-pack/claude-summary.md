## Building software (build pack)

The full rules are in `extras/build-pack/claude-section.md`: read them before
planning, building, running or checking code in a session. Always:
- `notes/requirements.md` is the only map of what the software must do, and
  its **route** (one line per stage, on one screen) is the one overall plan
  kept here. Plan only the current stage in detail, in `plans/`.
- Never drop or shrink a requirement without my yes; record changes of
  direction with `/decide`.
- For each task: mark it started, state the check in plain words, see it
  fail, make the change, see it pass *(ran it)*. Stop and ask before new
  tables, libraries, outside services, anything about logins, anything that
  costs money or sends data out.
- Nothing runs until "Safe to run?" in `notes/codebase.md` says yes; made-up
  data only.
- No branches in this workspace; commit at sign-off. Never write to a board,
  and keep "fixes" and similar words away from board IDs in commit
  messages. Going live always asks.
- Talk my way: requirements in words, not IDs, unless I use the IDs. No
  counts of what's left.
