# Installing the visuals pack (Claude follows this when I ask)

Never during first setup. Two parts; install only the part I ask for.

## Diagrams (free)

1. Copy `skills/diagram` into `.claude/skills/`, and
   `files/templates/mermaid-preview.html` into `tools/`. Never overwrite.
2. Tell me in one line: "Say 'draw a diagram of…' any time."

## AI pictures (paid; only when I ask)

1. **Explain first, in a few lines,** and wait for my yes:
   - it needs a Google AI Studio API key with billing switched on;
   - each image costs money: check the current price on Google's pricing
     page (ai.google.dev/gemini-api/docs/pricing) and say where the number
     came from, in US dollars with a rough figure in pounds;
   - you ask before every paid request, and Claude Code's approval box
     after that is the actual send button: choose **Yes**, never "don't ask
     again";
   - prompts on Google's free tier can be used to improve its products; on
     the paid tier they aren't.
2. **Files.** Copy `skills/picture` into `.claude/skills/`,
   `files/tools/make-image.sh` into `tools/` (keep it executable), and
   `files/notes/visuals-spend.md` into `notes/`. Never overwrite.
3. **Guard rail.** Add `Bash(tools/make-image.sh *)`,
   `Bash(./tools/make-image.sh *)` and `Bash(bash tools/make-image.sh *)`
   to the `ask` list in `.claude/settings.json`, keeping everything else
   exactly as it is. Tell me in one plain line: "Claude Code will always
   ask before sending a picture request, even if you once said 'don't ask
   again'."
4. **Billing and a cap.** Walk me through switching on billing in Google AI
   Studio, then setting a **monthly spend cap** on its Spend page (suggest
   something small, like £5). Check the current wording of those pages
   before describing them. Say that Google's figures can lag by a few
   minutes, so the cap is a safety net, not a hard stop.
5. **The key.** Check `.env` is ignored (`git check-ignore -v .env`).
   - Tell me to make a key: Google AI Studio → **API keys** → **Create API
     key**. (Check that page's current wording first.)
   - If `.env` doesn't exist, create it with one line: `GEMINI_API_KEY=`.
   - Open it for me to edit, without reading it yourself: Mac
     `open -e .env`; Windows `notepad .env`. "Paste your key straight after
     the = sign (add that line if it isn't there), save, and close."
   - Never ask me to paste the key into the chat. Never open, print or
     search `.env` by any command. If I paste or say a key in the chat,
     tell me to delete it in AI Studio and make a new one.
6. Record it with `/decide` ("AI pictures set up: Gemini, paid tier, cap
   £<n>/month").
7. Tell me in one line: "Say 'make a picture of…' when you want one. I'll
   always tell you the cost first."
