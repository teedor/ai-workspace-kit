# Installing the visuals pack (Claude follows this when I ask)

Never during first setup. Two parts; install only the part I ask for.

## Diagrams (free)

1. Copy `skills/diagram` into `.claude/skills/`.
2. Tell me in one line: "Say 'draw a diagram of…' any time."

## AI pictures (paid; only when I ask)

1. **Explain first, in a few lines:** it needs a Google AI Studio API key
   with billing switched on; each image costs money (check the current price
   on Google's pricing page, ai.google.dev/gemini-api/docs/pricing, and say
   where the number came from); Claude asks before every paid request; the
   free tier's prompts can be used to improve Google's products, the paid
   tier's aren't. Wait for my yes.
2. Copy `skills/picture` into `.claude/skills/`, `files/tools/make-image.sh`
   into `tools/`, and `files/notes/visuals-spend.md` into `notes/` (never
   overwrite).
3. Check `.env` is ignored (`git check-ignore -v .env`). Then the key:
   - Tell me to get a key: Google AI Studio → **API keys** → **Create API
     key**. (Check that page's current wording before telling me.)
   - If `.env` doesn't exist, create it with one line: `GEMINI_API_KEY=`. If
     it exists, don't open it: ask me to add that line myself.
   - Open it for me to edit: Mac `open -e .env`; Windows `notepad .env`.
     "Paste your key straight after the = sign, save, and close." Never ask
     me to paste the key into the chat, and never read `.env`.
4. Record it with `/decide` ("AI pictures set up: Gemini, paid tier").
5. Tell me in one line: "Say 'make a picture of…' when you want one. I'll
   always tell you the cost first."
