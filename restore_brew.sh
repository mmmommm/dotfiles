#!/bin/bash

# Restore Homebrew and install packages from Brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file=Brewfile
