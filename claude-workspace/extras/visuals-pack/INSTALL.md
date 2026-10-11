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
   - how often you check the cost with me is my choice (step 3), and I
     can change it any time;
   - prompts on Google's free tier can be used to improve its products; on
     the paid tier they aren't.
2. **Files.** Copy `skills/picture` into `.claude/skills/`,
   `files/tools/make-image.sh` into `tools/`, and
   `files/notes/visuals-spend.md` into `notes/`. Never overwrite.
3. **How to check the cost with me.** Ask once: "Shall I check the cost
   with you before **every** picture (a good way to start), only when a
   request would cost more than an amount you choose, or **never**?" Write
   my answer at the top of `notes/visuals-spend.md` (**Asking:** …).
   - **Every picture:** also add `Bash(tools/make-image.sh *)`,
     `Bash(./tools/make-image.sh *)` and `Bash(bash tools/make-image.sh *)`
     to the `ask` list in `.claude/settings.json` (keeping everything else
     exactly as it is), so Claude Code's approval box always appears: tell
     me that box is the actual send button.
   - **Over an amount, or never:** don't add those lines. If I'm happy for
     requests to go without a question, that's my call.
   I can change this any time by saying so: update the **Asking** line, and
   add or remove those three lines to match.
4. **Billing, and a cap if I want one.** Walk me through switching on
   billing in Google AI Studio, then offer to help me set a **monthly spend
   cap** on its Spend page (my choice, and my amount). Check the current wording of those pages
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
6. Record it with `/decide` ("AI pictures set up: Gemini, paid tier;
   asking: <my choice>; cap: <amount, or none>").
7. Tell me in one line: "Say 'make a picture of…' when you want one. I'll
   always tell you the cost first."
