# Installing the linked repos pack (Claude follows this from /link-repo)

Only when I ask to link a repository; never during first setup. Say in one
line what it adds, then:

1. **Rules.** Add `claude-section.md` to this folder's `CLAUDE.md`, as its
   own section after "How the folders fit together". Show me the text first.
2. **Skill.** Copy `skills/link-repo` into `.claude/skills/`.
3. **Register.** Copy `files/repos.md` into the folder. Never overwrite an
   existing one.
4. **Check the guard rail.** `.claude/settings.json` should have
   `Bash(git -C *)` and `PowerShell(git -C *)` in its `ask` list (the kit
   ships with them). If they're missing, add them, keeping everything else
   exactly as it is, and tell me in one plain line: "I'll ask you before any
   git command in a linked repository."
5. Tell me in two lines what changed, then carry on with `/link-repo`.
