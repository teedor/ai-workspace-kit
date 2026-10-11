# Claude project folder

A folder where Claude works with you on anything (a book, a codebase, a
business, a project) and remembers between sessions because it writes
everything down here.

**Talk, don't type:** use speech-to-text for almost everything.

**Every session:** say hello → Claude offers one next step → "go" → work →
"that's it" (or just close the window). New files go in `inbox/`.

**Before anything goes out:** `/plain` → `/red-team` → `/signoff`.

You can type the `/` word or just say what you want ("process the inbox",
"that's it for today"). The exceptions are `/setup` and `/red-team`, which
you type.

| Skill | What it does |
|---|---|
| `/setup` | First-time setup (run once) |
| `/start` | Start a session with one small, ready-to-go next step |
| `/intake` | Sort everything in `inbox/` and empty it |
| `/idea` | Write up an idea, including the case against it and a way to test it |
| `/decide` | Record a decision and what it replaces |
| `/plain` | Take the jargon out of a piece of writing |
| `/red-team` | Three independent critics pick holes in your work before anyone else sees it |
| `/signoff` | Go through the work waiting for your sign-off |
| `/handover` | End a session: write the plan for next time and save a snapshot |
| `/new-skill` | Turn something that worked into a reusable skill, for this project or all of them |
| `/meeting` | Prepare for a meeting, or file the notes afterwards |
| `/new-project` | Start a separate workspace folder for a different project |
| `/tailor` | Check how this setup fits your work; at most three changes, each only if you say yes |

The standing rules are in `CLAUDE.md`. Skills live in `.claude/skills/`, one
folder each, and are plain text. Edit them, or ask Claude to make new ones.

**Start here:** in the Claude app, Code tab, start a new session with this
folder as the project folder, then type `/setup`. In a terminal, start
`claude`, `gemini` or `codex` in this folder, then type `/setup` (with
Codex, `$setup`).

**Gemini CLI and Codex** read the same rules and skills through small
adapters: `GEMINI.md` and `.gemini/` for Gemini, `AGENTS.md` and `.codex/`
for Codex. Change a skill once, in `.claude/skills/`.

**One folder per project** ("new project" makes another). Things true for all your work live in your global
file (`~/.claude/CLAUDE.md`; Gemini: `~/.gemini/GEMINI.md`; Codex:
`~/.codex/AGENTS.md`) and global skills (`~/.claude/skills/`), which every
workspace shares.

**Assessed work?** `/setup` can add the study pack in `extras/study-pack/`:
you write, Claude teaches and questions, and AI use is logged.

**Diagrams and pictures?** Say "draw a diagram of…": the pack in
`extras/visuals-pack/` draws flowcharts, timelines and small family trees
for free. AI-made pictures are optional and cost money, and Claude always
tells you the cost first.

**Work in other git repositories?** Say "link a repo": the pack in
`extras/linked-repos/` keeps a register of them, read-only by default. Their
code stays outside this folder. (Claude Code only, for now.)
