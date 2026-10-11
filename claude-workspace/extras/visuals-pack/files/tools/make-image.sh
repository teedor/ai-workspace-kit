#!/usr/bin/env bash
# Make one image with a Gemini image model and save it as a PNG.
#   tools/make-image.sh <model> <output.png> "<prompt>"
# Reads GEMINI_API_KEY from .env in the project folder. Never prints the key.
# Each run is ONE paid request: Claude asks before running it.
# Untested against the live API when this kit was written: if it fails, read
# the error it prints and check Google's current docs.
set -euo pipefail
cd "$(dirname "$0")/.."

[ $# -eq 3 ] || { echo "Usage: tools/make-image.sh <model> <output.png> \"<prompt>\""; exit 2; }
model="$1"; out="$2"; prompt="$3"
[ -e "$out" ] && { echo "Not overwriting $out: choose another name."; exit 2; }

key="$(grep -E '^GEMINI_API_KEY=' .env 2>/dev/null | head -n1 | cut -d= -f2- | tr -d '\r"' || true)"
[ -n "$key" ] || { echo "No GEMINI_API_KEY in .env. Add it there yourself (never in the chat)."; exit 2; }

# Make the prompt safe to put inside JSON.
esc="$(printf '%s' "$prompt" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | tr '\n\t' '  ')"
body="{\"contents\":[{\"parts\":[{\"text\":\"$esc\"}]}],\"generationConfig\":{\"responseModalities\":[\"IMAGE\"]}}"

resp="$(mktemp)"; trap 'rm -f "$resp"' EXIT
# The key goes in a header read from a file descriptor, so it isn't on the command line.
curl -sS -X POST \
  "https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent" \
  -H "Content-Type: application/json" \
  -H @<(printf 'x-goog-api-key: %s\n' "$key") \
  -d "$body" -o "$resp"

data="$(tr -d '\n' < "$resp" | grep -o '"data": *"[^"]*"' | head -n1 | sed -e 's/^"data": *"//' -e 's/"$//' || true)"
if [ -z "$data" ]; then
  echo "No image came back. The service said:"
  grep -o '"message": *"[^"]*"' "$resp" | head -n3 || head -c 600 "$resp"
  exit 1
fi
mkdir -p "$(dirname "$out")"
printf '%s' "$data" | base64 --decode > "$out"
echo "Saved $out"
