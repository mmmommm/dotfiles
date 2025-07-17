#!/bin/bash -e

# ~/.claude ディレクトリが存在するか確認
if [ ! -d "$HOME/.claude" ]; then
  echo "Error: ~/.claude directory not found"
  exit 1
fi

# .claude ディレクトリを作成（存在しない場合）
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

# commands ディレクトリをコピー
if [ -d "$HOME/.claude/commands" ]; then
  echo "Copying ~/.claude/commands/..."
  mkdir -p ".claude/commands"
  cp -rv "$HOME/.claude/commands/"* ".claude/commands/" 2>&1 | sed 's/^/  /' | grep -v "^  $HOME/.claude/commands/\." || true
fi

echo ""
echo "Claude files pulled successfully from ~/.claude/"
