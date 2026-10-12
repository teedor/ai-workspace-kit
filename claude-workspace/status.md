# Status: where things stand

*Claude keeps this up to date. It is more current than anything else here.*

**Last updated:** (not yet)

## Current goal
- Setting up this project.

### Next steps
*Small, verb-first steps that each end in something visible. `·easy` marks the
ones that need no thinking.*
- (none yet)

## Dates
*Hand-in dates, meetings, deadlines: each with where it came from. Claude never
invents a date.*
- (none yet)

## Waiting on
- Nothing yet.

## How I tend to work
*Claude's notes on my rhythm, learned from how sessions actually go. A
description, not a target.*
- Not enough sessions yet.

## Setup extras (optional)
*Offered one at a time, at the end of a session that went well, each one
once: note "offered YYYY-MM-DD" beside it and move on to the next. None
while a date under "Dates" is less than two weeks away. I can also ask for
one any time ("set up About me").*
- **Check the fit** (`/tailor`): offer this first, at the end of the first
  session after setup that went well, with an example that fits my work:
  "Next time, say 'check the fit' and I'll suggest up to three small
  changes so this suits your work better, like <example>. You approve each
  one, and it uses a little of your allowance." One critic by default, all
  three if I ask.
- **About me:** create or extend `~/.claude/CLAUDE.md` with who I am, the work
  I do, whether I mostly talk or type, whether I use Word, and anything you
  must never do, written as preferences that make sense in any folder. Never
  replace existing content; warn that it applies to every project; show me
  the text first. Also list `~/.claude/skills/` and offer to rename any of
  this kit's skills that clash (a global skill would win).
- **Style guide:** from two or three samples (in the inbox, or pasted). If
  this is assessed work, use samples only to give feedback, never to write in
  my voice.
- **Default critics** for `/red-team`.
- **Dictation:** recommend a proper dictation app over the computer's
  built-in one, which stops on pauses and can't keep up with fast talk. In
  Claude Code, `/voice` then hold Space (audio goes to Anthropic).
  Otherwise Wispr Flow (wisprflow.ai: Mac, Windows; cloud, free up to a
  weekly limit; suggest turning off its training data sharing) or Handy
  (handy.computer: free, on my computer, Mac, Windows, Linux; best if I
  talk about other people's details). Give me the web address; I install
  it.
- **Word export:** check you can make a `.docx`, and explain any install first.
- **Make the allowance last** (Pro plan): offer it unprompted only if I've
  mentioned hitting my limit or use Claude most days; otherwise wait to be
  asked. If I mention hitting the limit, note it under "How I tend to work".
  Ask which plan I'm on. **On Pro:** Claude Code starts on Opus, which uses
  the allowance fastest. Suggest Sonnet as my everyday model, and say
  honestly that it handles most work well but can be a little less thorough
  on the hardest problems, when I can switch back for one piece of work.
  To make it my default, offer to save `"model": "sonnet"` in my own
  settings (`~/.claude/settings.json`, which the app and the terminal both
  use, for every project): say it's outside this folder and wait for my
  yes. If that file exists, add only the `model` line and keep everything
  else exactly as it is; if it already sets a model, tell me
  which and ask; if it isn't valid JSON, don't touch it and tell me. Never
  put a model in this project's `.claude/settings.json`. Show me the
  **Model** dropdown next to the send button: it shows which model I'm on,
  and I can switch there for one piece of work. If I've turned on usage
  credits, say once that a bigger model spends them faster too.
  If I ask about a bigger model, say whether my plan charges extra for it.
  **On any other plan,** change nothing.
