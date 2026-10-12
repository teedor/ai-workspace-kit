# Installing the build pack (Claude follows this when I ask, or say yes to it)

Never during first setup. Offer it in one line when I ask to build software
from a brief or a list, or when `/intake` brings in a requirements document,
spec or board export in a project with code: "Want the build pack? It keeps
the list of what this must do and plans it one stage at a time." Install
only after my yes.

**Not with assessed work.** If the study pack is installed, don't install
this: say in one line that it has Claude doing work that may be marked.

1. **Rules.** Add `claude-summary.md` to this folder's `CLAUDE.md` as its
   own section, after "How the folders fit together". It points to the full
   rules in `claude-section.md`, which stay in this pack folder: never
   delete them. Show me the text first.
2. **Skills.** Copy `skills/requirements`, `skills/stage` and
   `skills/check-stage` into `.claude/skills/`. For Gemini CLI and Codex,
   also copy the matching files from `adapters/.gemini/commands/` into
   `.gemini/commands/`, and from `adapters/.codex/skills/` into
   `.codex/skills/`.
3. **Files.** Copy `files/notes/requirements.md` and `files/notes/codebase.md`
   into `notes/`, and `files/plans/README.md` into `plans/`. Never overwrite
   an existing file.
4. **Code in this project.** If "Code in this project" in `CLAUDE.md` says
   no, change it to yes, and tell me.
5. **Where the code is.** If it's in a linked repository (`repos.md`), it
   must be read-write: the pack runs tests there. If it's read-only, say so
   and ask whether to change that with `/link-repo`.
6. Record it with `/decide` ("Build pack installed"). Tell me in two lines
   what changed, then carry on with `/requirements`.
