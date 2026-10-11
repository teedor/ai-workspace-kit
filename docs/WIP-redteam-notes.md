# WIP red-team notes (session branch only: delete before merging to main)

Findings waiting to be applied when work resumes. Sifted, not yet acted on.

## Visuals pack (extras/visuals-pack/)

Fact-check (2026-10-11; Google pages via site-restricted search, not fetched):
- `gemini-nano-banana-2.1` is real, GA 2026-10-06, recommended; v1beta
  `generateContent` POST, `x-goog-api-key`, `responseModalities: ["IMAGE"]`
  alone is fine, image in `inlineData.data` (base64). generateContent is
  "legacy but fully supported".
- Price ≈ US$0.034 per 1K image, plus thinking tokens; free tier "Not
  available" for 2.1 (cookbook claims Lite has one: conflict).
- Paid tier not used to improve products; free tier is. UK/EEA/CH: paid
  terms apply to all use. SynthID on all images.
- Spend cap: AI Studio → Spend → Monthly spend cap; billing data lags
  ~10 minutes, so not a hard stop. Budget alerts in Cloud Billing.
- mermaid.live "Actions" card has PNG/SVG; GitHub renders ```mermaid.
- Code tab: "Click an HTML, PDF, image, or video path in the chat to open
  it there" (Claude can't open the pane itself).
- macOS base64 accepts `--decode`. `open -e` / `notepad` unverified.

To apply:
1. Diagram viewing: give the path and "click it"; fallback `open`/`start`.
   Preview page gets Save-as-PNG/SVG buttons; mermaid.live only a fallback.
   Rebuild preview after each change.
2. Family trees: Mermaid suits ~3 generations; one branch per diagram.
   Check "Personal details" before naming living people (GitHub publishes).
3. Cost gate: add `Bash(tools/make-image.sh *)`, `Bash(./tools/make-image.sh *)`,
   `Bash(bash tools/make-image.sh *)` to `ask` at install; README: choose
   "Yes", never "don't ask again". Keep the chat confirmation.
4. Key safety: key said/pasted in chat → revoke and make new; never
   inspect .env by any command, never `bash -x`; ask me to check it.
   If .env exists, open it the same way and ask me to add the line.
5. Script: header via `printf … | curl -H @- …` (Windows-safe; tested);
   strip spaces in key; take the image part (skip `"thought": true`, check
   mimeType), `tail -n1`; output must be under drafts/images/*.png, no
   `..`; model name `^[a-z0-9.-]+$`; on failure say "may still have been
   charged: check Spend page".
6. Spend log: add Result column (saved / failed).
7. Wording: price "from a few cents to tens of cents, depending on model
   and size; Claude checks"; ask shows US$ and rough £; print-size note.
   "lists no free tier for the recommended model". Offer spend cap at
   install (say £5). Billing walkthrough (check wording).
8. Ethics: no realistic pictures of real people (living or dead) or real
   events that could pass as a record; no logos, brands, copyrighted
   characters. Name files `<name>-ai.png`.
9. Tell them once: the approval box is the actual send button.

## Copilot plan (docs/copilot-cli-plan.md)

Corrections: settings subset is "such as" (drop the `model` claim);
~/.claude/CLAUDE.md not-read citation → instructions table; repos can ship
`deniedUrls`/`disabledSkills` but no file allow/ask/deny; reads auto-approved
so .env readable; PowerShell 7 recommended, 5.1 works with reduced
reliability; `.claude/agents/critic.md` loads (no `.agent.md` needed): close
that question. README's "premium requests" is legacy; AI credits now.

Additions: no way in for Copilot users (install sentence + hand-over);
prompt fatigue → blanket approvals; adapter only in a personal workspace,
never a team repo; study pack must log actual model; one "Using GitHub
Copilot instead" guide section, not a fork; open questions: 📁 line, skill
name clashes with built-ins (/setup?), admin policy; run Copilot test in
parallel with the Claude run.

Safety wording false under Copilot (fix in adapter, or make core say "never
open it" as well as "blocked"): claude-workspace/CLAUDE.md rule 3 ("you
can't read it", "sent to Anthropic"), intake skill ("blocked from reading"),
visuals README, link-repo skill and claude-section ("blocked").
Cheap core fix now: rule 3 also says "never open .env, .pem or key files,
even if you can"; "sent to the AI service you're using" (consider).

Hook: Copilot-only `.github/hooks/kit-guard.json` (version 1, bash and
powershell), deny (exit 2) on .env/.pem/key paths; "ask" for git push /
reset / clean / rm / Remove-Item; allow on internal error (a crashing hook
denies everything). Don't share with Claude Code. "A guard, not a lock."
