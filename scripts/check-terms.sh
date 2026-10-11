#!/usr/bin/env bash
# Pre-publish check: fail if any term in the local, untracked .private-terms file
# (one per line: names, clients, anything that must never be published) appears
# anywhere in the tracked files. The list itself is never committed.
set -euo pipefail
cd "$(dirname "$0")/.."
[ -f .private-terms ] || { echo "No .private-terms file; nothing to check."; exit 0; }
hits=0
while IFS= read -r term; do
  [ -z "$term" ] && continue
  if git grep -n -i -F -- "$term" >/dev/null 2>&1; then
    echo "FOUND a private term (line $((hits+1)) of .private-terms):"
    git grep -n -i -F -- "$term" | sed 's/^/  /'
    hits=$((hits+1))
  fi
done < .private-terms
[ "$hits" -eq 0 ] && echo "Clean: no private terms in tracked files." || exit 1
