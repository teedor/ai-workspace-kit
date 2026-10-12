# Build pack

For building software from an overall goal and a list of what it has to do:
a brief, a requirements document, stories exported from a board (Azure
DevOps, GitHub Projects, Jira), or just what you say it should do. The list
is the big picture; only the next **stage** is planned in detail, so
changing direction costs little and is written down.

It isn't part of first setup. Say "set up the build pack", or drop a brief
or a board export in the inbox in a project with code, and Claude offers it.

**What it adds**
- `notes/requirements.md`: the goal, the list of what the software must do
  (each with where it came from, using a board's own IDs where there is
  one), what we're **not** doing and why, and the **route**: one line per
  stage, in order. That fits on one screen.
- `notes/codebase.md` (existing code): what it runs on, how to run it and
  its tests, **whether that's safe** (a separate test database, or the real
  one?), and what makes it go live.
- `plans/`: one file per stage: what you'll be able to do when it's
  finished, what must be true, and small tasks, each with a check.
- `/requirements`: build or refresh the list and the route, from a
  document, a board export, or by talking it through.
- `/stage`: plan the next stage, asking you only about how things should
  work, not about the technology.
- `/check-stage`: check a finished stage against what it was meant to do,
  with fresh eyes, and give you a few things to try by hand.

**How a stage goes.** `/stage` plans it. Then the usual rhythm: say hello,
Claude offers the next task, "go". Each task has a check, stated in plain
words *before* the code is written, and seen to fail and then pass.
`/check-stage` has a separate critic compare the code with the
requirements, not with the task list, and hunt for checks that only look
like checks. You try the main things yourself, on made-up data. Then
`/signoff`, and the next stage.

**Changing direction** is normal. Say what's changed, or export the board
again: Claude shows what's new, changed or gone, and records any change of
plan with `/decide`. Nothing on the list is ever dropped or shrunk without
you saying so.

**Good to know**
- Nothing runs until you've said it's safe to: tests and the app can touch
  a real database, send real emails or take real payments.
- Nothing goes live, and nothing is pushed or published, without your yes.
- Claude never closes or moves items on your board. It doesn't write to the
  board at all, and it keeps words like "fixes" away from board IDs in
  commit messages, because merging those can close items automatically.
- For assessed work (the study pack), the build pack isn't used: it has
  Claude doing work that may be marked.
- The code can be in this folder, or in a linked repository Claude may
  change (read-write). A read-only linked repository can't be tested from
  here.

**At work.** Your employer's rules come first: use the account and tools
they approve, and put their AI rules in `notes/ai-policy.md` (`/setup` asks
about them). Your organisation's own Claude Code settings, if it has any,
override this kit's. A board export usually names your colleagues and
sometimes customers: export only the columns you need, and leave out
"Assigned to", "Created by" and anything with customer details.

**Reading a board directly** (for developers who already use these): the
pack starts from an exported file, but Claude can read the same slice
through a connection you already have, with your yes and never to write.
Keep the connection read-only: GitHub's MCP server has a `--read-only`
mode; Azure DevOps's hosted MCP server takes an `X-MCP-Readonly: true`
header, but its local server has no read-only switch, so block its write
tools in your settings (including `wit_backlog`, which can reorder). Checked
2026-10-12; these change often.

**Big builds.** For dozens of requirements across a large codebase or a
team, a dedicated spec-driven tool may suit you better. This pack is for
one person moving steadily through a brief.
