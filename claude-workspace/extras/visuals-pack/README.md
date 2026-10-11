# Visuals pack

Pictures for your work, in two parts. It isn't part of first setup: say
"draw me a diagram" or "set up pictures" when you want it.

**1. Diagrams: free, nothing to sign up for.** Flowcharts, timelines, small
family trees, org charts, process maps. Claude writes them as **Mermaid** (a
plain-text way of describing a diagram) or as an **SVG** (a picture file
drawn from text), and makes a preview page next to each one. Click the
preview's name in the chat to see it in the Claude app; it has buttons to
save the diagram as a PNG or SVG picture. GitHub also draws Mermaid diagrams
in Markdown files, but only put them there if it's fine for them to be seen.
Mermaid suits a small family tree (about three generations); for a whole
family, draw one branch per diagram, or use family-tree software.

**2. AI pictures: optional, and they cost money.** Illustrations and
mock-ups made by an image model through an API (a way for programs to talk
to a service). The pack is set up for **Google's Gemini image models**. You
need a Google AI Studio API key with billing switched on: Google's pricing
page lists no free tier for the recommended model. Prices run from a few US
cents to tens of US cents per image, depending on the model and size;
Claude checks the current price for you.
- You choose how often Claude checks the cost with you: before every
  picture (a good way to start), only above an amount you set, or never.
  When it checks, it tells you the model, how many images and the estimated
  cost, and waits for your yes. Change your mind any time by saying so.
- If you'd like one, Claude helps you set a monthly spend cap in Google AI
  Studio. Google's spending figures can lag by a few minutes, so it's a
  safety net, not a hard stop.
- Every request is logged in `notes/visuals-spend.md`.

**Good to know**
- Your key goes in a `.env` file that you fill in yourself. Git ignores it,
  and Claude never opens it: a small script reads it when making a picture.
  If you ever say or paste the key in the chat, delete it in AI Studio and
  make a new one.
- Google's terms differ by tier: on its free (unpaid) services, prompts can
  be reviewed by people and used to improve its products; on the paid tier,
  they aren't. Don't send anything confidential either way.
- Every image from Google's current models carries an invisible SynthID
  watermark, and the pack names each file `…-ai.png`. Say a picture is
  AI-made when you publish it.
- No realistic pictures of real people, living or dead, or of real events,
  that could be mistaken for a photograph or a record. No logos, brands or
  copyrighted characters.
- Assessed work: AI images follow your rules for AI use like anything else,
  and are logged.
