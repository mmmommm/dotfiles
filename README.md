# dotfiles

my dotfile

# usage

```terminal
git clone https://github.com/mmmommm/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
./deploy.sh
chsh -s /bin/zsh
echo $SHELL
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

権限で怒られるので
`chmod 777 setup.sh`　する必要がある

## git が入っていない場合

git コマンドがあるかを確認  
`git --version`

brew コマンドがあるかを確認  
`brew list`

それぞれ[ここ](https://tracpath.com/bootcamp/git-install-to-mac.html)を見れば全部できるはず
