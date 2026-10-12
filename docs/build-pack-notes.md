# Build pack: design notes

*Why the build pack (`claude-workspace/extras/build-pack/`) is shaped the
way it is, what it borrowed and from where, and what was deliberately left
out. Facts were checked on 2026-10-12 against the sources named; recheck
before relying on them, as these tools change monthly.*

## The idea

Someone building software from a brief or a backlog gets an overall plan
without losing the kit's freedom to change direction:

- **The what** is fixed in one place: `notes/requirements.md`, the list of
  what the software must do, from a requirements document, a board export
  (Azure DevOps, GitHub Projects, Jira) or by talking. The board stays the
  master; the kit keeps a dated snapshot and shows what changed on each
  re-import.
- **The how** is planned only one stage ahead. The route is one line per
  stage, so changing direction throws away at most one stage of planning,
  and the change is recorded with `/decide`.

## What it borrowed from spec-driven tools

Mostly cheap prompt discipline, not machinery. Sources: GSD Core
(github.com/open-gsd/gsd-core, commit b747aca) and the archived GSD repo.

- Requirements as testable one-line statements with IDs, mapped to stages,
  with an "out of scope" list that keeps its reasons.
- Ask about assumptions rather than interrogate: GSD's "assumptions" mode
  takes about 2–4 exchanges instead of 15–20 questions
  (`docs/how-to/discuss-a-phase.md`).
- An explicit list of what Claude may decide on its own.
- Every task has a check that can fail ("`echo done`" is banned), and the
  first slice of new code works end to end.
- Verification against the goal, not the task list, by fresh eyes.
- Rules for going off-plan: fix what you broke, stop before structural
  changes, give up after three tries, never swap a package after a failed
  install.
- A plan check for missing decisions, shrinking words ("for now",
  "placeholder") and unconnected parts.

## What it left out, and why

Executor sub-agent swarms, parallel waves, git worktrees, parallel research
agents, plan-revision loops, XML plans, a `.planning/` tree, hooks and a
status line, autonomous modes, YOLO or skip-permissions, and progress
percentages. GSD's own docs admit "ceremony for simple tasks" and "model
cost amplification", and its context-quality thresholds are "a policy
default, not a benchmark constant". The kit's handover-then-start rhythm
already gives a fresh context between sessions. Fresh-context executors can
be tried later, tested as an `/idea` (the same stage inline vs a sub-agent,
comparing results, tokens and time).

## What the critics changed

Four fresh-context critics (a non-programmer with a brief, a developer who
uses GSD, a security reviewer, a fact-checker) reviewed the first design.
The main changes:

- **No branches inside a workspace.** The notes and the code share one
  history, so `/handover` would commit `status.md` and `done.md` to the
  branch and strand them there.
- **"Safe to run?" before anything runs.** Claude Code's `.env` deny rules
  stop its own file tools, not a test runner, and many small apps have only
  one database.
- **The checker can't be "read-only by promise".** The main session runs the
  tests behind the gate, and the existing read-only `critic` does the
  comparing, so no new agent with shell access is needed (and it works in
  Gemini CLI and Codex as they are).
- **Checks are stated in plain words before the code, and seen to fail and
  then pass**, because Claude writes both the code and the test.
- **Ask about how the work happens, not about technology**: a
  non-programmer can't judge "use the existing login?".
- **Things briefs often forget** (logins and who sees what, personal data,
  backups, payments, sensitive data, accessibility).
- **No counts of what's left**, stages named by what you'll be able to do,
  and IDs kept out of chat unless the person uses them.
- **Not for assessed work**: it has Claude drafting requirements, design
  choices, code and tests that may be marked.

## Board facts relied on

- Azure Boards: a query's actions menu has **Export to CSV**, with the
  query's columns (MicrosoftDocs/azure-devops-docs,
  `docs/boards/queries/import-work-items-from-csv.md`).
- GitHub Projects: a view's menu has **Export view data**, a `.tsv` file
  (github/docs, `.../managing-your-project/exporting-your-projects-data.md`).
- Closing words: GitHub closes an issue when a pull request or commit with
  "Closes #10" (or fix, resolve and their forms) reaches the default branch
  (`.../linking-a-pull-request-to-an-issue.md`). Azure Boards moves a work
  item when merged text has "Fixes AB#123" or a state name before the ID
  (`docs/boards/github/link-to-from-github.md`). Hence the pack's "Work
  items:" line.
- Read-only connections: GitHub's MCP server has `--read-only`
  (github/github-mcp-server README). Azure DevOps's hosted MCP server takes
  an `X-MCP-Readonly` header; its local server has no read-only switch, and
  its `wit_backlog` tool can reorder (microsoft/azure-devops-mcp,
  `docs/TOOLSET.md`).
- Claude Code: managed settings override project settings; commercial terms
  (Team, Enterprise, API) don't train on prompts unless the organisation
  opts in; consumer accounts may if the setting is on
  (code.claude.com/docs/en/settings.md, data-usage.md). `/requirements`,
  `/stage` and `/check-stage` don't clash with built-in commands; `/import`
  does (commands.md).
- Not confirmed: Jira's CSV export details (Atlassian's sites were
  unreachable), so the pack only says "its own export to CSV, if it has
  one".

## Follow-ups for the core kit (not done here)

Raised by the critics, independent of the pack:
- `permissions.disableBypassPermissionsMode: "disable"` in the kit's
  settings (it works from any settings file).
- Deny rules for common credential files (`credentials.json`,
  `serviceAccountKey.json`, `wp-config.php`).
- A connection-string pattern (`://user:password@`) in `/handover`'s key
  check.
- `/signoff` asking before committing to `main` in solo projects too.
