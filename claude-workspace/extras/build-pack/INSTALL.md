# Installing the build pack (Claude follows this when I ask, or say yes to it)

**When to offer it.** Never during `/setup`, and never with assessed work.
Otherwise, offer it once, in one line, when I ask to build software from a
brief or a list, or when `/intake` brings in a requirements document, spec
or board export in a project with code: "Want the build pack? It keeps the
list of what this must do and plans it one stage at a time." It counts as
the session's one offer, and a no goes in "Declined suggestions" in
`notes/style-guide.md`. Install only after my yes.

0. **Checks first.**
   - **Assessed work:** if the study pack is installed, stop: say in one
     line that this pack has Claude doing work that may be marked.
   - **A team's repository:** if this folder is a git repository other
     people also work in, stop. The workspace's notes would end up in their
     branches and pull requests. Recommend a separate workspace (`/new-project`)
     with this repository linked read-write (`/link-repo`), and install the
     pack there.
1. **Rules.** Add `claude-summary.md` to this folder's `CLAUDE.md` as its
   own section, after "How the folders fit together". It points to the full
   rules in `claude-section.md`, which stay in this pack folder: never
   delete them. Tell me in two plain lines what the rules do, and offer to
   show me the exact text.
2. **Skills.** Copy `skills/requirements`, `skills/stage` and
   `skills/check-stage` into `.claude/skills/`. For Gemini CLI and Codex,
   also copy the matching files from `adapters/.gemini/commands/` into
   `.gemini/commands/`, and from `adapters/.codex/skills/` into
   `.codex/skills/`.
3. **Files.** Copy `files/notes/requirements.md` and `files/notes/codebase.md`
   into `notes/`, and `files/plans/README.md` into `plans/`. Never overwrite
   an existing file.
4. **Guard rails.** In `.claude/settings.json`, keeping everything else
   exactly as it is, add to the `ask` list:
   - `Edit(./notes/codebase.md)`, because it holds the "Safe to run?"
     answers, which only I change;
   - board and deploy commands, in both forms:
     `Bash(gh issue:*)`, `Bash(gh project:*)`, `Bash(gh pr merge:*)`,
     `Bash(az boards:*)`, `Bash(az repos pr:*)`, `Bash(npm publish:*)`,
     `Bash(vercel:*)`, `Bash(npx vercel:*)`, `Bash(netlify deploy:*)`,
     `Bash(npx netlify deploy:*)`, `Bash(firebase deploy:*)`,
     `Bash(npx firebase deploy:*)`, and the same as `PowerShell(gh issue *)`
     and so on.

   Tell me in one plain line: "I'll ask you before any change to the notes
   on how the code runs (they hold the safety answers), and before anything
   that touches your board or puts the software live."
5. **Code in this project.** If "Code in this project" in `CLAUDE.md` says
   no, change it to yes, and tell me.
6. **Where the code is.** If it's in a linked repository (`repos.md`), it
   must be read-write: the pack runs tests there. If it's read-only, say so
   and ask whether to change that with `/link-repo`.
7. Record it with `/decide` ("Build pack installed"). Tell me in two lines
   what changed, then carry on with `/requirements`.
