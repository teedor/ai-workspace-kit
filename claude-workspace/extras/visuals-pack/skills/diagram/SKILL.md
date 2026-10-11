---
name: diagram
description: Draw a diagram (flowchart, timeline, small family tree, org chart, process map) as Mermaid or SVG, free and with no sign-up. Use when I say "draw a diagram of…", "make a flowchart", "sketch how this fits together" or similar.
---

Draw the diagram I describe. It's free: no key, no account, no paid service.

1. **Ask only what you must:** what it shows and who it's for. Keep it to
   what fits on one screen; split a big one into parts. A family tree in
   Mermaid works up to about three generations: for more, draw one branch
   per diagram, or suggest family-tree software.
2. **Pick the format:**
   - **Mermaid** for flowcharts, timelines, sequences, small family trees
     and org charts: write it in a Markdown file in `drafts/`, inside a
     ```` ```mermaid ```` block.
   - **SVG** for anything Mermaid draws badly (a simple map, a labelled
     layout): write the SVG by hand in `drafts/`, plain shapes and readable
     text.
   Add it to `review-queue.md` like any other draft.
3. **Make a preview** for Mermaid: copy `tools/mermaid-preview.html` to
   `drafts/<name>-preview.html`, fill in the title, file name and the
   Mermaid text. **Rebuild it whenever the diagram changes**, so the two
   never drift apart. It has **Save as PNG** and **Save as SVG** buttons.
4. **Show me:** give me the preview's (or SVG's) path and say "click it to
   open it here." If that doesn't work, open it in my usual browser (Mac
   `open <file>`, Windows `start <file>`).
5. **Facts and people.** Names, dates and relationships come from my notes
   or sources, never from memory (rule 2). Anything uncertain gets a "?"
   and goes in `notes/open-questions.md`. Check "Personal details in this
   project" before naming living people, and remember GitHub shows Mermaid
   diagrams to anyone who can see the repository. Use mermaid.live only if
   the preview fails, and only for diagrams with nothing confidential in
   them: it's a website.
6. Change it by editing the same file; git keeps the history.
