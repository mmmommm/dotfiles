# dotfiles

my dotfile

# usage

```terminal
git clone https://github.com/mmmommm/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

[これ](https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d#pencil2-git-prompt--git-prompt-%E3%81%AE%E7%94%A8%E6%84%8F)
にそって `git completion zsh` の設定をする

## git が入っていない場合
git コマンドがあるかを確認
`git --version`

brew コマンドがあるかを確認
`brew list`

それぞれ[ここ](https://tracpath.com/bootcamp/git-install-to-mac.html)を見れば全部できるはず

## Go のインストール
[go bootstrap](https://go.dev/doc/install/source)でインストール

ほんとは go のダウンロードいらないらしいけどうまくいかないので `wget` でとってきてる

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
