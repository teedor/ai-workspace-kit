---
name: check-stage
description: Check a finished stage of the build against what it was meant to do, with a fresh critic comparing the code with the requirements rather than the task list, then give me a few things to try by hand. Use when I say "check the stage", "is it really done", "does it do what the spec says".
---

Check the stage I name, or the current one. Follow the build pack's rules
(`extras/build-pack/claude-section.md`). The point is to check the
software against the **requirements**, not to tick off the task list.

## 1. Run the checks, only if it's safe

Read the stage file and "Safe to run?" in `notes/codebase.md`.
- **Not yes:** run nothing. Record the checks as *not run*, with why, and
  go to step 2.
- **Yes:** note `git status --porcelain`. Run the project's tests and each
  task's check, on made-up data. Put a short summary in the stage file
  under "Check results" *(ran it)*: what passed, what failed, and the last
  few lines of any failure. Then run `git status --porcelain` again. If
  running them changed or created files, tell me which, and ask before
  undoing anything (rule 8).

## 2. A fresh critic

Ask the **`critic`** sub-agent (in `.claude/agents/`) to compare the code
with the requirements. It can only read. Give it the file paths, not your
summary:
- the stage file, `notes/requirements.md` and `notes/codebase.md`;
- the files changed since the stage started (`git diff --name-only
  <Started at>`, plus uncommitted changes), and their tests.

Its role: "a checker who doesn't trust the task list". Ask it, for each
"must be true" and each requirement in this stage:
- Is it actually there in the code, and reachable from where a person
  would start (a page, a button, a command)?
- Is it tested by a test that would fail if it broke?
- Are any tests fake: testing a mock instead of the real thing, asserting
  nothing, skipped, or with stored snapshots updated to match?
- Any shrinking words in code or comments ("TODO", "for now",
  "placeholder", "hard-coded", "stub")?
- Anything changed that this stage didn't ask for?

Each finding: the file and line, what's wrong, and how sure it is.

## 3. Sift, and turn gaps into tasks

Be sceptical of the critic: drop anything wrong, or a matter of taste, and
tell me in one line what you dropped. Each gap that holds up becomes a new
task at the end of the stage file ("Fix: <what>"), and the stage's status
goes back to `building`. Only those tasks need checking again.

## 4. Things for me to try

If it's safe to run, start the app on this computer with made-up data, and
give me one link or command. Then, **one at a time**, up to three things to
try for each "must be true", in plain words ("Book Biscuit for Tuesday at
10, then cancel it. Does the slot come free?"). Record what I saw *(you
told me)*. If something can't be tried by hand, say so.

## 5. Ready for sign-off

When the checks pass, the critic's points are dealt with, and I've tried
the main things:
- Set the stage's status to `checked`.
- Add one row to `review-queue.md` for the stage: where (the stage file,
  and the commits or changes since "Started at"), made by Claude, and what
  to check: what I tried and saw, anything the critic flagged that I should
  know, and plainly what I can't check myself (security, payments, how
  personal details are kept).
- Say in one line: "Stage <name> is ready to sign off. Say 'sign it off'
  when you're happy."

After `/signoff` approves it: mark the stage `signed off`, its requirements
`done` in `notes/requirements.md`, and set the First step to planning the
next stage.
