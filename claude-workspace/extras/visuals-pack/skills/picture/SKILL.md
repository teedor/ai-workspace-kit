---
name: picture
description: Make an AI-generated picture through Google's Gemini image API, which costs money per image. Always states the cost and waits for a yes first. Use when I say "make a picture of…", "generate an image", "illustrate this".
---

Make a picture with the paid image API. **Every request costs money, so
nothing is sent without my yes.** If AI pictures aren't set up (no
`tools/make-image.sh`), offer to set them up with
`extras/visuals-pack/INSTALL.md` instead, and stop.

1. **Would a diagram do?** If what I want is a chart, a flowchart or a
   family tree, say so and offer `/diagram`, which is free.
2. **Check the price once per session.** Look up the current model and
   price per image on Google's pricing page
   (ai.google.dev/gemini-api/docs/pricing). If you can't reach it, use the
   last price in `notes/visuals-spend.md`, with its date, and say it may be
   out of date. Never guess a price.
3. **Write the prompt** with me: what's in it, the style, and what it's for.
   No real, identifiable people without their permission, nothing
   confidential (it's sent to Google), nothing that copies a named living
   artist's style.
4. **Ask, every time,** in one message: "That's <n> image(s) with <model>,
   about <cost> (<source>, <date>). Go ahead?" For several images, give the
   total. A yes covers exactly what you described, nothing more.
5. **Log it first,** in `notes/visuals-spend.md`, then run
   `tools/make-image.sh <model> drafts/images/<name>.png "<prompt>"` once per
   image. Never read `.env`, never print the key, and never retry a failed
   paid request without asking.
6. **Look at the result** (open the PNG) and say in one line whether it
   matches what I asked for. It's a draft: add it to `review-queue.md`, noted
   as AI-made. If I publish it, I say it's AI-made.
7. **Assessed work** (study pack in): follow `notes/ai-policy.md`, and log
   it in `notes/ai-use-log.md`.
