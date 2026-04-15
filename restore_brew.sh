#!/bin/bash

# Install Homebrew if not already installed
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Restore packages from Brewfile
brew bundle install --file=Brewfile
