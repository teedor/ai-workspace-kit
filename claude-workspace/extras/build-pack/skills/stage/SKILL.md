---
name: stage
description: Plan the next stage of the build in detail (what I'll be able to do when it's finished, what must be true, and small tasks, each with a check), asking me only about how things should work, not the technology. Use when I say "plan the next stage", "what's next on the build", "let's start stage 2".
---

Plan one stage: the next one on the route in `notes/requirements.md`, or the
one I name. Follow the build pack's rules
(`extras/build-pack/claude-section.md`).

## 1. Read quietly

`notes/requirements.md`, `notes/codebase.md`, `decisions/decisions-log.md`,
`notes/style-guide.md`, and the previous stage's file in `plans/` if there
is one. If the previous stage hasn't been signed off, say so in one line
and ask whether to carry on anyway. If the route is empty, suggest
`/requirements` first and stop.

## 2. Ask only about how things should work

At most three questions, **one at a time** (unless my style guide says I
like them in a batch), about how the work happens, never about technology:
"Can someone book two dogs into one slot?", "How late can people cancel?"
- Technical choices (frameworks, file layout, how data is stored) go under
  "Claude may choose" in the stage file, written down, not asked.
- **Except:** a new database table or changed data structure, a new
  library or outside service, anything about logins or who can see what,
  anything that costs money, and anything that sends data out. Ask about
  those in plain words, with what each option means for me.
- Record each answer that settles something with `/decide`.

## 3. Write the stage file

`plans/stage-NN-<short-name>.md`:

```
# Stage NN: <what I'll be able to do>

**Requirements:** <IDs>
**Status:** building
**Started at:** <current commit, short form>

## Must be true when it's finished
- <a statement I could try by hand, in plain words> (<ID>)

## Decisions
- D<n>: <one line>

## Claude may choose
- <technical choices, with the one you'll make>

## Not in this stage
- <anything nearby that's deliberately left for later>

## Tasks

### 1. <what I'll see when it's done>: to do
- **Files:** <the files it touches>
- **Check:** <in plain words>; `<command>`
- **Done when:** <observable result>

### 2. <name>: to do
(Only the next two or three tasks in full; later ones as one-line headings,
filled in when they come up.)

## Check results
(Filled in by /check-stage.)
```

- Two to three "must be true" statements per requirement, each one I could
  try myself.
- Size each task to fit one typical session ("How I tend to work" in
  `status.md`); no task touching more than about five files.
- For the first stage of new code, the first task is the simplest version
  that works from start to finish.
- Every check must be able to fail: never "it runs" or "no errors" on its
  own. If "Safe to run?" in `notes/codebase.md` isn't yes yet, write the
  checks anyway and say they'll wait for that answer.

## 4. One fresh look before I see it

Ask the **`critic`** sub-agent (in `.claude/agents/`) to check the stage
file against `notes/requirements.md`, `decisions/decisions-log.md` and
`notes/codebase.md`. Its role: "a plan checker". Ask it:
- Is every requirement and decision for this stage carried out by some task?
- Does any wording quietly shrink the work ("for now", "placeholder",
  "stub", "simplified", "mock", "hard-coded")?
- Are the parts connected (for example, a form that saves, *and* a page that
  shows what was saved)?
- Has anything from "Not doing" crept in?
- Could each check actually fail?

Be sceptical of its points: fix what holds up, without a second round. Tell
me only what changed because of it, in one line.

## 5. Show me, briefly

Say the stage's name and its "must be true" list, in plain words, and any
decisions. Don't read out the tasks unless I ask.

## 6. Finish

- `status.md`: the current goal becomes this stage.
- `handover.md`: the First step is task 1, in the usual form (a verb, the
  exact file, no decisions needed).
- Add the stage file to `review-queue.md` (made by Claude; what to check:
  the "must be true" list matches what I want).
- Say once, as a suggestion: "The plan's written down. If you start the
  building in a fresh session, we'll find out whether the plan stands on
  its own." Never press it.
