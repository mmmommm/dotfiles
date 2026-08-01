#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
EXCLUDES=(.git .gitignore .claude .vscode .DS_Store README.md Makefile bin)

cd "$SCRIPT_DIR"

should_exclude() {
  local file="$1"
  for exc in "${EXCLUDES[@]}"; do
    if [ "$file" = "$exc" ]; then
      return 0
    fi
  done
  return 1
}

for f in .??* *; do
  [ "$f" = ".??*" ] && continue
  should_exclude "$f" && continue

  if [ "$f" = ".ssh_config" ]; then
    mkdir -p "$HOME/.ssh"
    cp "$f" "$HOME/.ssh/config"
    echo "  $f -> ~/.ssh/config"
  else
    cp -r "$f" "$HOME/"
    echo "  $f -> ~/$f"
  fi
done

echo "Done."
