#!/bin/bash

# Back up current Homebrew packages to Brewfile
brew bundle dump --file=Brewfile --force
