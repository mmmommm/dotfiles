#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Color output helpers
green() { printf '\033[32m%s\033[0m\n' "$*"; }
red()   { printf '\033[31m%s\033[0m\n' "$*"; }
yellow(){ printf '\033[33m%s\033[0m\n' "$*"; }

# Check prerequisites
check_prerequisites() {
  local missing=0
  for cmd in git zsh; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      red "Error: '$cmd' is not installed."
      missing=1
    fi
  done
  if [ "$missing" -eq 1 ]; then
    red "Please install the missing tools and try again."
    exit 1
  fi
  green "All prerequisites satisfied."
}

# Symlink dotfiles to home directory
deploy_dotfiles() {
  local success=0
  local failed=0

  for f in "$DOTFILES_DIR"/.??*; do
    local name
    name="$(basename "$f")"

    case "$name" in
      .git|.DS_Store|.brewfile|.gitconfig.local.template|.gitmodules|.claude|.vscode)
        continue
        ;;
    esac

    # Remove existing symlink or file
    if [ -L "$HOME/$name" ]; then
      unlink "$HOME/$name"
    elif [ -e "$HOME/$name" ]; then
      yellow "Warning: $HOME/$name exists and is not a symlink. Skipping."
      failed=$((failed + 1))
      continue
    fi

    if ln -s "$f" "$HOME/$name"; then
      green "Linked: $name"
      success=$((success + 1))
    else
      red "Failed to link: $name"
      failed=$((failed + 1))
    fi
  done

  echo ""
  echo "Dotfiles deployed: $success succeeded, $failed skipped/failed."
}

# Install Prezto if not already present
install_prezto() {
  local prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"
  if [ -d "$prezto_dir" ]; then
    yellow "Prezto is already installed at $prezto_dir. Skipping."
    return
  fi

  green "Installing Prezto..."
  if git clone --recursive https://github.com/sorin-ionescu/prezto.git "$prezto_dir"; then
    green "Prezto installed successfully."
  else
    red "Failed to install Prezto."
    exit 1
  fi
}

# Change default shell to zsh
change_shell() {
  local zsh_path
  zsh_path="$(which zsh)"

  if [ "$SHELL" = "$zsh_path" ]; then
    yellow "Default shell is already zsh. Skipping."
    return
  fi

  green "Changing default shell to zsh..."
  if chsh -s "$zsh_path"; then
    green "Default shell changed to zsh."
  else
    red "Failed to change default shell. You may need to run: chsh -s $zsh_path"
  fi
}

echo "=== Dotfiles Setup ==="
echo ""

check_prerequisites
deploy_dotfiles
install_prezto
change_shell

echo ""
green "Setup complete!"
