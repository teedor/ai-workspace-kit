---
name: picture
description: Make an AI-generated picture through Google's Gemini image API, which costs money per image. Always states the cost, and checks with me first as often as I've chosen. Use when I say "make a picture of…", "generate an image", "illustrate this".
---

Make a picture with the paid image API. **Every request costs money.** How
often you check the cost with me is my choice: it's the **Asking:** line at
the top of `notes/visuals-spend.md`. If AI pictures aren't set up (no
`tools/make-image.sh`), offer to set them up with
`extras/visuals-pack/INSTALL.md` instead, and stop.

1. **Would a diagram do?** If what I want is a chart, a flowchart or a
   family tree, say so and offer `/diagram`, which is free.
2. **Check the model and price once per session** on Google's pricing page
   (ai.google.dev/gemini-api/docs/pricing). Start from
   `gemini-nano-banana-2.1` at the standard size, unless the page says it's
   been replaced. If you can't reach the page, use the last price in
   `notes/visuals-spend.md`, with its date, and say it may be out of date.
   Never guess a price. If the picture is for print (a cover, a poster),
   say the standard size may be too small, and what a bigger one costs.
3. **Write the prompt** with me: what's in it, the style, and what it's
   for. Nothing confidential (it's sent to Google). No realistic pictures
   of real people, living or dead, or of real events, that could be
   mistaken for a photograph or a record. No logos, brands, copyrighted
   characters, or copies of a named living artist's style.
4. **Check the cost with me, as I've chosen.** Work out the estimate:
   "<n> image(s) with <model>, about US$<x> (roughly £<y>) (<source>,
   <date>)", with the total for several images.
   - **Every picture:** say it and ask "Go ahead?". A yes covers exactly
     what you described, nothing more.
   - **Over an amount:** ask only if the request's total is over it;
     otherwise say the estimate in one line and go ahead.
   - **Never:** say the estimate in one line and go ahead.
   Whatever I've chosen, check if a request looks like a slip (500 images
   when the conversation was about 5, say).
5. **Log it first** in `notes/visuals-spend.md`, then run
   `tools/make-image.sh <model> drafts/images/<name>-ai.png "<prompt>"`
   once per image, and fill in the Result column.
6. **If it fails,** show me what the script said, and say it may still have
   been charged (the Spend page in AI Studio shows it). Never retry without
   asking. If the key isn't found or is rejected, ask me to check `.env`
   myself: never open, print or search it by any command, never run the
   script with `-x`, and never change it to print more.
7. **Look at the result:** give me the path and say "click it to open it
   here", and say in one line whether it matches what I asked for. It's a
   draft: add it to `review-queue.md`, noted as AI-made. If I publish it, I
   say it's AI-made.
8. **Assessed work** (study pack in): follow `notes/ai-policy.md`, and log
   it in `notes/ai-use-log.md`.
