#!/bin/bash

# brewをリストア
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
brew bundle install --file=.brewfile
