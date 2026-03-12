#!/bin/bash
# Records each user prompt to a daily markdown file on the Desktop.
# Receives JSON on stdin from Claude Code's UserPromptSubmit hook.

INPUT=$(cat)
PROMPT=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('prompt',''))" 2>/dev/null)

if [ -z "$PROMPT" ]; then
  exit 0
fi

DATE=$(date +%Y-%m-%d)
FILE="$HOME/Desktop/prompts-${DATE}.md"

if [ ! -f "$FILE" ]; then
  echo "# Prompts — ${DATE}" > "$FILE"
  echo "" >> "$FILE"
  COUNT=1
else
  COUNT=$(grep -c '^[0-9]\+\.' "$FILE" 2>/dev/null || echo 0)
  COUNT=$((COUNT + 1))
fi

echo "${COUNT}. ${PROMPT}" >> "$FILE"

exit 0
