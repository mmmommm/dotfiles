# dotfiles

my dotfile

# usage

```terminal
git clone https://github.com/mmmommm/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

## git が入っていない場合
git コマンドがあるかを確認
`git --version`

brew コマンドがあるかを確認
`brew list`

それぞれ[ここ](https://tracpath.com/bootcamp/git-install-to-mac.html)を見れば全部できるはず

## Go のインストール
[go bootstrap](https://go.dev/doc/install/source)でインストール

ほんとは go のダウンロードいらないらしいけど、うまくいかないので `wget` でとってきてる

```terminal
$ mkdir tmp
$ wget https://storage.googleapis.com/golang/go1.21.1.darwin-arm64.tar.gz
$ tar zxvf go1.21.1.darwin-arm64.tar.gz -C tmp/
$ mv tmp/go ~/go
$ git clone https://go.googlesource.com/go goroot
$ cd goroot
$ git checkout go1.21.1
$ cd src
$ ./all.bash
```

### Go のアップデート

[Keeping up with releases](https://go.dev/doc/install/source) を参考に
`${HOME}/go/src` ではなく `${HOME}/goroot/src` にあるので

```terminal
$ cd goroot/src
$ git fetch
$ git checkout <tag>
$ ./all.bash
```

## その他使用しているもののインストール
- [これ](https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d#pencil2-git-prompt--git-prompt-%E3%81%AE%E7%94%A8%E6%84%8F)
にそって `git completion zsh` の設定をする
- [これ](https://eng-blog.iij.ad.jp/archives/19131)にそって `kube-ps1` の設定をする
- [これ](https://www.canva.com/design/DAFGYeHVyzA/9Xgj4-HZAF02UXHm7ol_FQ/view)にそって `raycast` の設定をする
  - my schedule (apple login してカレンダー紐付け)
  - clipboard history に cmd + shift + c でホットキー設定

```terminal
brew install --cask raycast
brew install wget
brew install fzf
brew install asdf

mkdir ~/.zsh
cd ~/.zsh

curl -o git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
```
