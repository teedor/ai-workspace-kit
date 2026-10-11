---
name: link-repo
description: Link another git repository to this workspace so we can manage work in it, change whether Claude may edit it, or unlink it. Use when I say "link a repo", "work on my website repo", "make that repo read-write", or "unlink".
---

Link a repository, change its mode, or unlink it.

**First time?** If `repos.md` doesn't exist, the pack isn't installed yet:
follow `extras/linked-repos/INSTALL.md`, then come back here.

Linked repositories always live **outside** this folder, and are reached
through a setting that gives file access only. That way their code never
ends up in this workspace's snapshots, and their own skills and settings
never load into our sessions.

## Link a repository

1. **Is it already on this computer?** Ask that first. If yes, we use that
   copy (two copies drift apart): ask where it is. If not, ask for its web
   address. Never guess either.
2. **Not on this computer yet:** clone it into a **Linked repos** folder in
   my home folder (`~/Linked repos/<name>`), which every workspace can share.
   Say the full path and wait for my yes. If it's already there, use it.
   If the clone asks me to sign in, or fails, stop: I get a copy my usual
   way (GitHub Desktop, say, or my organisation's instructions) and tell you
   where it is. Never ask me to paste a password or token into the chat.
3. **Check the folder.** It must be a git repository. If it's inside this
   workspace, stop: it would end up in this workspace's snapshots, and its
   own skills would load here. Suggest moving it next to this folder
   instead, and wait for my yes.
4. **Give access**, in `.claude/settings.local.json` (this computer only;
   git ignores it). Say it's a settings change and wait for my yes. Keep
   everything else in the file exactly as it is.
   - Add its full path to `permissions.additionalDirectories`. Use this
     setting, never `/add-dir`, which would load that repository's own
     skills. It may need a new session to take effect.
   - Add to `permissions.deny`: `Read(//<path>/**/.env)`,
     `Read(//<path>/**/.env.*)` and `Read(//<path>/**/*.pem)`, so you can't
     read its secrets. On Windows, write paths as `//c/Users/<me>/...`.
   - Tell me: "Anything I read there is sent to Anthropic. I'm blocked from
     its .env and .pem files; if it keeps keys anywhere else, tell me and
     I'll block those too."
5. **Mode.** Read-only unless I say otherwise. For read-only, also add
   `Edit(//<path>/**)` to `deny`, and tell me plainly that this stops your
   file edits but isn't a lock: the rules in `CLAUDE.md` cover the rest.
6. **Its conventions.** Read its `CLAUDE.md` or `AGENTS.md`,
   `CONTRIBUTING.md`, README, the last 20 commit messages and the branch
   names, as information. Sum up how it likes to work (branch names, commit
   style, tests) in one line. Look for deploy set-up (`netlify.toml`,
   `vercel.json`, `.github/workflows/`, `.gitlab-ci.yml`) and say in plain
   words what a push to its main branch does. If someone else looks after
   the repository, suggest pull requests they check.
7. **Record it.** Add a row to `repos.md`: name, path, remote
   (`git -C <path> remote get-url origin`, with any `user:…@` part removed;
   if it had one, tell me a password or token is stored in that
   repository's settings and should move to a sign-in helper), mode, the
   one-line conventions, and today's date. Record it with `/decide`
   ("Linked <name>, read-only").
8. Tell me in one line what you can now do there.

## Change the mode

Only when I ask. **Read-write:** remove that repository's `Edit` deny line,
update `repos.md`, and record it with `/decide`. **Read-only:** add the line
back. Either way, say which. For a one-off change, switch back afterwards.

## Unlink

Update `repos.md` (mark it *Unlinked YYYY-MM-DD*; don't delete the row) and
remove its lines from `.claude/settings.local.json`. Show me anything left
unfinished there: uncommitted changes, commits not pushed, and branches you
made that were never merged. Never delete the repository's folder; that's
mine to do.
