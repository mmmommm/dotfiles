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

### Xcode Command Line Tools

`make setup` の実行には Xcode Command Line Tools が必要です。未インストールの場合は以下を実行してください。

```terminal
xcode-select --install
```

### 確認

```terminal
git --version   # git コマンドがあるか確認
make --version  # make コマンドがあるか確認
```

> **Note:** Homebrew は `make setup` の中で自動インストールされるため、事前のインストールは不要です。

### dotfiles のバックアップについて

`make install` は既存のファイル（シンボリックリンクではない実ファイル）を `~/.dotfiles_backup/<timestamp>/` に自動でバックアップしてからシンボリックリンクを作成します。既にシンボリックリンクが張られている場合はバックアップなしで上書きされます。

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

## Git コミットメッセージテンプレート

`.gitmessage` に [Conventional Commits](https://www.conventionalcommits.org/) ベースのテンプレートが設定されています。
`git commit` を実行するとエディタにテンプレートが表示されるので、type・scope・subject を埋めてコミットメッセージを作成してください。

```
<type>(<scope>): <subject>
```

利用可能な type: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `ci`, `chore`

## その他使用しているもののインストール
- git completion / prompt スクリプトは `make setup` (または `make git-completion`) で自動的にインストールされます
- [これ](https://eng-blog.iij.ad.jp/archives/19131)にそって `kube-ps1` の設定をする
- [これ](https://www.canva.com/design/DAFGYeHVyzA/9Xgj4-HZAF02UXHm7ol_FQ/view)にそって `raycast` の設定をする
  - my schedule (apple login してカレンダー紐付け)
  - clipboard history に cmd + shift + c でホットキー設定
