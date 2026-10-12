---
name: check-stage
description: Check a finished stage of the build against what it was meant to do, with a fresh critic comparing the code with the requirements rather than the task list, then give me a few things to try by hand. Use when I say "check the stage", "is it really done", "does it do what the spec says".
---

Check the stage I name, or the current one. Follow the build pack's rules
(`extras/build-pack/claude-section.md`). The point is to check the
software against the **requirements**, not to tick off the task list.

**Assessed work** (the study pack is installed): stop, and say in one line
that the build pack isn't used for assessed work.

Read the stage file first. Its "Repository" line says where the code is:
in a linked repository, run every git command there with `git -C "<path>"`.

## 1. Run the checks, only if it's safe

Read "Safe to run?" in `notes/codebase.md` for that repository.
- **Tests not yet safe:** run nothing. Record the checks as *not run*, with
  why, and go to step 2.
- **Safe:** note `git status --porcelain`. Run the project's tests and each
  task's check, on made-up data. Put a short summary in the stage file
  under "Check results" *(ran it)*: what passed, what failed, and the last
  few lines of any failure, with keys, passwords, connection strings and
  personal details removed. Then run `git status --porcelain` again. If
  running them changed or created files, tell me which, and ask before
  undoing anything (rule 8).
- In a team's repository, also note whether its own checks (CI) passed on
  the latest push, if there's been one.

## 2. A fresh critic

Ask the **`critic`** sub-agent (in `.claude/agents/`) to compare the code
with the requirements. It can only read. Give it the file paths, not your
summary:
- the stage file, `notes/requirements.md` and `notes/codebase.md`;
- the files changed since the stage started (`git diff --name-only <Started
  at>`, which includes uncommitted changes, plus new untracked files: `??`
  in `git status --porcelain`), and their tests.

Its role: "a checker who doesn't trust the task list". Ask it to give each
"must be true" and each requirement in this stage one verdict, with the
file and line:
- **proven:** there in the code, reachable from where a person would start
  (a page, a button, a command), and tested by a test that would fail if it
  broke;
- **there but unproven:** present, but no real test covers it;
- **partly**, or **missing**.

And to look for:
- fake tests: testing a mock instead of the real thing, asserting nothing,
  skipped, or with saved expected-output files updated to match;
- shrinking words in code or comments ("TODO", "for now", "placeholder",
  "hard-coded", "stub");
- **unrequested** changes: anything this stage didn't ask for;
- in a team's repository, anything on its definition of done that isn't
  met.

## 3. Sift; gaps come first

Be sceptical of the critic: drop anything wrong, or a matter of taste, and
tell me in one line what you dropped. If gaps hold up ("partly", "missing",
fake tests, unrequested changes), each becomes a new task at the end of the
stage file ("Fix: <what>"), the stage's status goes back to `building`, the
First step becomes the first fix, and **stop here**: only those tasks are
checked again next time. A gap I agree to leave goes under "Known gaps",
with why and a D-number.

## 4. Things for me to try

When there are no gaps left, and only if running the app is safe: start it
on this computer with made-up data, and give me a link (or open it for me).
Then, **one at a time, at most five in all**, give me things to try, in
plain words ("Book Biscuit for Tuesday at 10, then cancel it. Does the slot
come free?"): every "must be true" that's only "there but unproven", plus
the stage's main thing once from start to finish. Record each answer as I
give it *(you told me)*. If something can't be tried by hand, say so.

## 5. Ready for sign-off

- Set the stage's status to `checked`, and its requirements' status in
  `notes/requirements.md` to "built, awaiting sign-off".
- Add one row to `review-queue.md`, status `NEEDS REVIEW`: What, "Stage NN:
  <name>"; Where, the stage file and the changes since "Started at"; Made
  by, Claude; What to check, what I tried and saw, anything the critic
  flagged that I should know, any known gaps, and plainly what I can't
  check myself (security, payments, how personal details are kept).
- Say in one line: "Stage <name> is ready to sign off. Say 'sign it off'
  when you're happy."

What happens after `/signoff` is in section 5 of the full rules.
