# Visuals pack

Pictures for your work, in two parts. It isn't part of first setup: say
"draw me a diagram" or "set up pictures" when you want it.

**1. Diagrams: free, nothing to sign up for.** Flowcharts, timelines, family
trees, org charts, process maps. Claude writes them as **Mermaid** (a plain
text way of describing a diagram) or as an **SVG** (a picture file drawn
from text). They live in your project like any other draft, and you can see
them:
- in the Claude app: Claude opens them in the Code tab's browser pane;
- on GitHub, which draws Mermaid diagrams in Markdown files;
- at mermaid.live, which can save them as PNG or SVG. It's a website, so
  don't paste anything confidential there.

**2. AI pictures: optional, paid.** Illustrations and mock-ups made by an
image model through an API (a way for programs to talk to a service). The
pack is set up for **Google's Gemini image models**. You need a Google AI
Studio API key, and billing switched on: Google's pricing page lists no free
tier for its current image models through the API. Images cost a few US
cents each at the standard size (Claude checks the current price for you).
Before **every** paid request, Claude tells you the model, how many images
and the estimated cost, and waits for your yes. Every request is logged in
`notes/visuals-spend.md`.

**Good to know**
- Your key goes in a `.env` file that you fill in yourself. Git ignores it,
  and Claude can't read it: a small script reads it when making a picture.
- Google's terms differ by tier: on its free (unpaid) services, prompts can
  be reviewed by people and used to improve its products; on the paid tier,
  they aren't used that way. Don't send anything confidential either way.
- Every image from Google's current models carries an invisible SynthID
  watermark. Say a picture is AI-made when you publish it.
- No pictures of real, identifiable people without their permission.
- Assessed work: AI images follow your rules for AI use like anything else,
  and are logged.
