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

Mostly cheap prompt discipline, not machinery. The main source is GSD
("Get Shit Done", now GSD Core: github.com/open-gsd/gsd-core, commit
b747aca, and the archived github.com/gsd-build/get-shit-done), with smaller
ideas from GitHub Spec Kit (github.com/github/spec-kit: verdicts against
requirement IDs, "unrequested" changes, previewing a sync before applying
it), Superpowers (github.com/obra/superpowers: watch the test fail), and
Kiro's EARS style ("When…, …") for "must be true" statements.

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

## How novel is it?

A prior-art scan on 2026-10-12 (spec-driven tools: GSD, Spec Kit, Kiro,
BMAD, OpenSpec, Superpowers, Task Master, Agent OS, CCPM; board-to-agent
integrations such as Copilot on Azure Boards, Jira and Linear; and
"second brain" kits for non-developers) found:

- **The mechanisms aren't new.** Planning one stage at a time,
  goal-backward verification that hunts stubs and mocks, watching tests
  fail first, human acceptance testing, fresh-context reviewers, a shared
  core with adapters per tool, and "the board is the master" all exist
  already. GSD alone covers most of what this pack does, with far more
  machinery.
- **The combination looks uncommon.** No other kit found pairs a
  plain-English workspace for any kind of work with a build workflow for
  people who aren't developers. Spec-driven tools are written for
  developers, and the non-developer kits are notes vaults.
- **So does the board approach.** Importing from a file export, keyed by the
  board's own IDs, into a dated snapshot that diffs on re-import, with the
  board staying the master and nothing written back, wasn't found
  elsewhere. The closest are Spec Kit community extensions for GitHub
  issues and Jira.
- **The stance as a set:** drafts until signed off, evidence tags, no
  streaks or guilt, low days, commit at sign-off, no closing keywords,
  "Safe to run?", hand-checks on made-up data, and inline work rather than
  agent swarms.

Where it's weaker: its rules are prose, not enforced code (GSD has a CLI,
Kiro has hooks); the board sync is one-way and manual; and the ecosystem is
tiny. The honest pitch is "a careful, plain-English way to build from a
brief, inside a workspace that also runs the rest of your work".

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
- Commit mentions: Azure Repos links a commit to work item `#123`
  mentioned in its message ("Commit mention linking", on by default), and an
  Azure DevOps pull request can complete its linked items when merged
  (`docs/repos/git/repository-settings.md`,
  `docs/repos/git/complete-pull-requests.md`). Hence board IDs stay out of
  commit messages unless the repository's convention uses them.
- Not confirmed: Jira's CSV export details and its "smart commits"
  (Atlassian's sites were unreachable). The pack only says "its own export
  to CSV, if it has one", and keeps "#" and a word away from Jira keys as a
  precaution.

## Second review round

Five more fresh critics (a non-programmer, a developer at work with Azure
DevOps, a security and data-protection reviewer, a consistency checker, a
fact-checker) reviewed the built pack. Main changes:

- "Safe to run?" is answered per repository, for tests and the app
  separately, only in the person's words; "I don't know" means no, and
  Claude offers to make it safe. Edits to `notes/codebase.md` ask.
- Setting names come from example files and code, never from files that
  hold secrets. The kit's deny list now matches `.geminiignore`, plus
  `local.settings.json`, `wp-config.php` and `*.tfstate`, and linked
  repositories get the same patterns.
- The policy check happens before an export is read, not after.
- Team repositories: never the workspace itself; one story per stage, on
  its own branch, committed per task, with a pull request; "done" means
  the team's definition of done; reviewers' comments become fix tasks.
- `/requirements` works in parts across sittings, starts existing code with
  "what have I got?" (the code, and whose name each account is in), saves
  the inherited code once, and previews any re-import before applying it.
- `/check-stage` gives each requirement a verdict (proven, there but
  unproven, partly, missing), flags unrequested changes, stops at gaps, and
  limits hand-checks to five.
- `/handover` now saves `plans/`; `/signoff` uses the pack's test commands
  only when safe; the intake offer respects the one-offer and no-setup
  rules; board and deploy commands ask.

## Follow-ups for the core kit (not done here)

- `permissions.disableBypassPermissionsMode: "disable"` in the kit's
  settings (it works from any settings file). A policy choice for the
  maintainer: it would also stop experienced users choosing bypass mode.
- Enforce the pack's two most important rules with Claude Code hooks
  rather than prose: block commit messages with closing words before a
  board ID, and ask before test commands when "Safe to run?" isn't yes.
- A connection-string pattern (`://user:password@`) in `/handover`'s key
  check.
- `/signoff` asking before committing to `main` in solo projects too.
- Linked repositories: let read-only git commands through without a
  prompt, to cut approval fatigue (needs checking against how ask and
  allow rules combine).
