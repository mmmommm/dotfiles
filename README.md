# dotfiles
my dotfile

## ZSH、TMUX
zshを使ってみたくてついでに作ろうと思い作りました。
linuxあまり深く理解できていないのでコードは他の方のを参考にしました。
もっと勉強して使いやすくしていきたいです。

# usage  
  
``` terminal
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

## gitが入っていない場合  
  
gitコマンドがあるかを確認  
`git --version`  
  
brewコマンドがあるかを確認  
`brew list`  
  
それぞれ[ここ](https://tracpath.com/bootcamp/git-install-to-mac.html)を見れば全部できるはず  
