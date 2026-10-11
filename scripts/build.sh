#!/usr/bin/env bash
# Build the guide PDF and the release zip.
#   scripts/build.sh            -> docs/Working with Claude - guide.pdf, dist/claude-workspace.zip
# Needs a Chromium-family browser for the PDF (set CHROME=/path/to/chrome if not found).
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="${CHROME:-$(command -v chromium || command -v chromium-browser || command -v google-chrome || echo /opt/pw-browsers/chromium)}"
"$CHROME" --headless --no-sandbox --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="docs/Working with Claude - guide.pdf" docs/guide.html 2>/dev/null
mkdir -p dist
rm -f dist/claude-workspace.zip
zip -qr dist/claude-workspace.zip claude-workspace
echo "Built: docs/Working with Claude - guide.pdf, dist/claude-workspace.zip"
