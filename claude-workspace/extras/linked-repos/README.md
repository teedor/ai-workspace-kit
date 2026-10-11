# Linked repos pack

For using this workspace to manage work that lives in **other git
repositories**: a website, an app, a client's codebase, an open-source
project. The workspace keeps the notes (status, decisions, the next step);
the code stays in its own repository, under that repository's own rules.

It isn't part of first setup. Say "link a repo" (or `/link-repo`) when you
need it, and Claude installs it then.

**What it adds**
- `repos.md`: a register of linked repositories: where each one is, where it
  came from, and whether Claude may change it (**read-only** unless you say
  otherwise).
- Linked repositories always stay **outside** this folder: one you already
  have stays where it is, and one Claude clones for you goes in a
  **Linked repos** folder in your home folder. Their code never ends up in
  this workspace's snapshots, and their own settings never load here.
- Rules (in `CLAUDE.md`): commits, branches and pull requests happen in the
  linked repository, following its own conventions; nothing is pushed
  without your yes.
- `/link-repo`: link a repository, change its mode, or unlink it.

**Read-only** means Claude reads, searches and explains, but doesn't edit
files, commit, or switch branches there. **Read-write** means it can, on a
branch of its own, and still asks before anything is pushed. Claude asks
before every git command it runs in a linked repository.

**Several clients?** One workspace each keeps their notes apart: say "new
project".
