#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$SCRIPT_DIR"

if [ ! -d ".claude" ]; then
  echo "Error: .claude directory not found in $(pwd)"
  exit 1
fi

# ~/.claude ディレクトリを作成（存在しない場合）
mkdir -p "$HOME/.claude"

echo "Copying .claude files to ~/.claude/..."
cp -rv .claude/* "$HOME/.claude/" 2>&1 | sed 's/^/  /' | grep -v "^  .claude/\." || true

echo ""
echo "Done."
