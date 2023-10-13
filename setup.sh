#!/bin/bash

# dotfileをホームディレクトリにリンク
for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".brewfile" ]] && continue
  [[ "$f" = ".git" ]] && continue
  [[ "$f" = ".gitconfig.local.template" ]] && continue
  [[ "$f" = ".gitmodules" ]] && continue

  echo "$f"
  # 既に貼られている symlink を削除
  unlink $HOME/$f
  # この shell ファイルがあるディレクトリから $HOME/ に symlink を貼る
  ln -s $(cd $(dirname $0); pwd)/$f $HOME/$f
done

# shell を zshに変更 (デフォルトが zsh になっているので不要かも)
chsh -s `which zsh`
# prezto のインストール
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
