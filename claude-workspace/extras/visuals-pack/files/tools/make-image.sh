#!/usr/bin/env bash
# Make one image with a Gemini image model and save it as a PNG.
#   tools/make-image.sh <model> drafts/images/<name>-ai.png "<prompt>"
# Reads GEMINI_IMAGE_KEY from .env in the project folder. Never prints the key.
# Each run is ONE paid request: Claude asks before running it.
# Tested against a mock of the API, not yet the live one: if it fails, read
# the error it prints and check Google's current docs.
set -euo pipefail
cd "$(dirname "$0")/.."

[ $# -eq 3 ] || { echo "Usage: tools/make-image.sh <model> drafts/images/<name>-ai.png \"<prompt>\""; exit 2; }
model="$1"; out="$2"; prompt="$3"
printf '%s' "$model" | grep -Eq '^[a-z0-9.-]+$' || { echo "That doesn't look like a model name: $model"; exit 2; }
case "$out" in
  *..*) echo "Save under drafts/images/, without '..'."; exit 2;;
  drafts/images/*.png) ;;
  *) echo "Save under drafts/images/, as a .png."; exit 2;;
esac
[ -e "$out" ] && { echo "Not overwriting $out: choose another name."; exit 2; }

key="$(grep -E '^GEMINI_IMAGE_KEY=' .env 2>/dev/null | head -n1 | cut -d= -f2- | tr -d '\r" ' || true)"
[ -n "$key" ] || { echo "No key found. Check .env yourself: the key goes on its own line, straight after GEMINI_IMAGE_KEY= (never paste it in the chat)."; exit 2; }

# Make the prompt safe to put inside JSON.
esc="$(printf '%s' "$prompt" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | tr '\n\t' '  ')"
body="{\"contents\":[{\"parts\":[{\"text\":\"$esc\"}]}],\"generationConfig\":{\"responseModalities\":[\"IMAGE\"]}}"

resp="$(mktemp)"; trap 'rm -f "$resp"' EXIT
# The key goes in a header read from standard input, so it isn't on the command line.
printf 'x-goog-api-key: %s\n' "$key" | curl -sS -X POST \
  "https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent" \
  -H "Content-Type: application/json" -H @- \
  -d "$body" -o "$resp"

# Take the last PNG part: any draft ("thought") images come before the final one.
data="$(tr -d '\n' < "$resp" \
  | grep -o '"inlineData": *{[^}]*}' \
  | grep '"mimeType": *"image/png"' \
  | tail -n1 \
  | grep -o '"data": *"[^"]*"' | sed -e 's/^"data": *"//' -e 's/"$//' || true)"
if [ -z "$data" ]; then
  echo "No PNG image came back. This request may still have been charged: check the Spend page in Google AI Studio. The service said:"
  grep -o '"message": *"[^"]*"' "$resp" | head -n3 || head -c 600 "$resp"
  exit 1
fi
mkdir -p "$(dirname "$out")"
printf '%s' "$data" | base64 --decode > "$out"
echo "Saved $out"
