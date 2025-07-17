#!/bin/bash -e

# .claude ディレクトリが存在するか確認
if [ ! -d ".claude" ]; then
  echo "Error: .claude directory not found in the current directory"
  exit 1
fi

# ~/.claude ディレクトリを作成（存在しない場合）
mkdir -p "$HOME/.claude"

# .claude 配下のすべてのファイルとディレクトリを再帰的にコピー
echo "Copying .claude files to ~/.claude..."
cp -rv .claude/* "$HOME/.claude/" 2>&1 | sed 's/^/  /' | grep -v "^  .claude/\." || true

echo ""
echo "Claude files copied successfully to ~/.claude/"
