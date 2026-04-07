# dotfiles

my dotfile

## Usage

```terminal
git clone https://github.com/mmmommm/dotfiles.git ~/dotfiles
cd ~/dotfiles
make setup
```

`make setup` を実行すると以下が自動で行われます。

1. Homebrew がなければインストール
2. `Brewfile` に記載されたパッケージをインストール (`brew bundle`)
3. dotfiles をホームディレクトリにシンボリックリンクで配置
4. git completion / prompt スクリプトを `~/.zsh/` にダウンロード

### Make targets

| コマンド | 説明 |
|---|---|
| `make setup` | Homebrew インストール + パッケージインストール + dotfiles 配置 (初回セットアップ用) |
| `make brew` | Homebrew のインストールと `brew bundle` の実行 |
| `make install` | dotfiles をホームディレクトリにシンボリックリンクで配置 |
| `make clean` | ホームディレクトリのシンボリックリンクを削除 |
| `make prezto` | Prezto (Zsh フレームワーク) のインストール |
| `make backup` | 現在インストールされている Homebrew パッケージを `Brewfile` にエクスポート |
| `make git-completion` | git completion / prompt スクリプトを `~/.zsh/` にダウンロード |
| `make list` | シンボリックリンク対象の dotfiles を一覧表示 |
| `make help` | 利用可能なコマンド一覧を表示 |

## Prerequisites

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
- git completion / prompt スクリプトは `make setup` (または `make git-completion`) で自動的にインストールされます
- [これ](https://eng-blog.iij.ad.jp/archives/19131)にそって `kube-ps1` の設定をする
- [これ](https://www.canva.com/design/DAFGYeHVyzA/9Xgj4-HZAF02UXHm7ol_FQ/view)にそって `raycast` の設定をする
  - my schedule (apple login してカレンダー紐付け)
  - clipboard history に cmd + shift + c でホットキー設定
