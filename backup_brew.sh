#!/bin/bash

# Export currently installed Homebrew packages to Brewfile
brew bundle dump --file=Brewfile --force
