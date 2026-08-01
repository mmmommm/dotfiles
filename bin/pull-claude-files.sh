#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$SCRIPT_DIR"

if [ ! -d "$HOME/.claude" ]; then
  echo "Error: ~/.claude directory not found"
  exit 1
fi

mkdir -p ".claude"

# CLAUDE.md をコピー
if [ -f "$HOME/.claude/CLAUDE.md" ]; then
  echo "Copying ~/.claude/CLAUDE.md..."
  cp -v "$HOME/.claude/CLAUDE.md" ".claude/" 2>&1 | sed 's/^/  /'
fi

# settings.json をコピー
if [ -f "$HOME/.claude/settings.json" ]; then
  echo "Copying ~/.claude/settings.json..."
  cp -v "$HOME/.claude/settings.json" ".claude/" 2>&1 | sed 's/^/  /'
fi

if [ -d "$HOME/.claude/commands" ]; then
  echo "Copying ~/.claude/commands/..."
  mkdir -p ".claude/commands"
  cp -rv "$HOME/.claude/commands/"* ".claude/commands/" 2>&1 | sed 's/^/  /' || true
fi

echo ""
echo "Done."
