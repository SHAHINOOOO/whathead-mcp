#!/usr/bin/env bash
# Validate the Whathead MCP docs repo: JSON parses, canonical endpoint is consistent,
# and no obviously-broken relative doc links.
set -euo pipefail

cd "$(dirname "$0")/.."

fail=0

echo "==> Validating JSON"
for f in .mcp.json server.json; do
  if command -v python3 >/dev/null 2>&1; then
    python3 -m json.tool "$f" >/dev/null && echo "  ok: $f"
  fi
done

echo "==> Checking canonical endpoint"
if grep -rInE "https?://[a-z.]*whathead\.com/mcp" --include=*.md --include=*.json . \
   | grep -vE "https://whathead\.com/mcp" ; then
  echo "  WARN: non-canonical endpoint URL found (expected https://whathead.com/mcp)"
  fail=1
else
  echo "  ok: all endpoints use https://whathead.com/mcp"
fi

echo "==> Checking relative markdown links resolve"
while IFS= read -r file; do
  while IFS= read -r link; do
    target="${link%%#*}"
    [ -z "$target" ] && continue
    case "$target" in http*|mailto:*) continue;; esac
    resolved="$(cd "$(dirname "$file")" && printf '%s' "$target")"
    if [ ! -e "$(dirname "$file")/$target" ]; then
      echo "  BROKEN LINK in $file -> $target"; fail=1
    fi
  done < <(grep -oE "\]\(([^)]+)\)" "$file" | sed -E 's/^\]\(//; s/\)$//')
done < <(find . -name '*.md' -not -path './.git/*')
[ "$fail" -eq 0 ] && echo "  ok: links resolve"

echo
if [ "$fail" -eq 0 ]; then echo "All checks passed."; else echo "Validation found issues."; exit 1; fi
