#!/bin/bash

# dotfileをホームディレクトリにリンク
for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".brewfile" ]] && continue

  echo "$f"
  unlink $HOME/$f
  ln -s $(cd $(dirname $0); pwd)/$f $HOME/$f
done

chsh -s `which zsh`
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
