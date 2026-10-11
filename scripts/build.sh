#!/usr/bin/env bash
# Build the guide PDF.
#   scripts/build.sh            -> docs/Working with Claude - guide.pdf
# Needs a Chromium-family browser for the PDF (set CHROME=/path/to/chrome if not found).
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="${CHROME:-$(command -v chromium || command -v chromium-browser || command -v google-chrome || echo /opt/pw-browsers/chromium)}"
"$CHROME" --headless --no-sandbox --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="docs/Working with Claude - guide.pdf" docs/guide.html 2>/dev/null
echo "Built: docs/Working with Claude - guide.pdf"
