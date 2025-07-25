#日本語を使用
export LANG=ja_JP.UTF-8
export USER_NAME=mmomm

export PATH=$PATH:$HOME/.config/cycloud/bin

# Common
export PATH="/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Java
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# Ansible
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOPRIVATE="github.com/cycloud-io,github.com/CyberAgent,github.com/mmmommm"
export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOBIN=$(go env GOPATH)/bin
export PATH=$PATH:$GOBIN
export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"

# Node
export VOLTA_HOME="$HOME/.volta"
export PATH=$PATH:$VOLTA_HOME/bin

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Python Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export PATH="/.local/bin/ansible:$PATH"

# Docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# Mongo
export PATH="/usr/local/mongodb/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"

# Istio
export PATH="$HOME/.istioctl/bin:$PATH"

# terminal color
export CLICOLOR=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=true

# kubernetes
export KUBERNETES_MASTER=$HOME/.kube/config

# kserve ref: https://kserve.github.io/website/latest/developer/developer/#install-knative-on-a-kubernetes-cluster
export KO_DEFAULTPLATFORMS=linux/arm64
export KO_DOCKER_REPO=docker.io/$USER_NAME
export KSERVE_ENABLE_SELF_SIGNED_CA=true

# シークレットファイルを読み込む
# source $HOME/dotfiles/.zshrc.local

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# fzf を用いて ghq のリポジトリ移動をできるように
# frepo() {
#   local dir
#   dir=$(ghq list > /dev/null | fzf-tmux --reverse +m) &&
#     cd $(ghq root)/$dir
# }
# zle -N frepo
# bindkey '^]' frepo

# Import other file
# source ~/dotfiles/.bash_profile

# bun
# source ~/.bun/bin

#alias一覧
alias reset='exec $SHELL -l'
alias k='kubectl'
alias h='fc -lt '%F %T' 1'
alias la='ls -a'
alias ll='ls -l'
alias sz='source ~/dotfiles/.zshrc'
alias home='cd ~/'
alias d='docker'
alias dc='docker-compose'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias g='git'
alias path='echo $PATH'
alias w='which'
alias mongodb='mongod --config /usr/local/etc/mongod.conf'
alias rck='kubectl run kise-curl --image=curlimages/curl -i --tty --rm -- sh'
alias rdk='kubectl run kise-dig --image=tutum/dnsutils -i --tty --rm -- sh'
alias rrk='kubectl run kise-redis --image redis:latest -it --rm -- bash'
alias mergekubeconf='KUBECONFIG=~/.kube/config.backup:~/.kube/config-gpuaas:~/.kube/config-ml kubectl config view --merge --flatten > ~/.kube/config'
alias copykubeconf='cp ~/.kube/config{,.backup}'

# プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~%# "
# cdなしでディレクトリ移動
setopt auto_cd
# コマンドのスペルチェックをする
setopt correct
# コマンドライン全てのスペルチェックをする
setopt correct_all
# カッコの対応などを自動的に補完する
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu
# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0
# beepを鳴らさないようにする
setopt nolistbeep
# 余分な空白は詰める
setopt hist_reduce_blanks
# 重複する履歴は古い方を削除
setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに記録しない
setopt hist_ignore_dups
# `switch-arch`でarm64とx86_64を切り替えられるように
setopt magic_equal_subst

# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }
is_exists() { type "$1" >/dev/null 2>&1; return $?; }
is_osx() { [[ $OSTYPE == darwin* ]]; }
is_screen_running() { [ ! -z "$STY" ]; }
shell_has_started_interactively() { [ ! -z "$PS1" ]; }
is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

# 補完を有効にする
autoload -Uz compinit
compinit -i

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# history
HISTSIZE=500000
SAVEHIST=500000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# arm版を優先的に使用するように
if (( $+commands[sw_vers] )) && (( $+commands[arch] )); then
	[[ -x /usr/local/bin/brew ]] && alias brew="arch -arch x86_64 /usr/local/bin/brew"
	alias x64='exec arch -x86_64 /bin/zsh'
	alias a64='exec arch -arm64e /bin/zsh'
	switch-arch() {
		if  [[ "$(uname -m)" == arm64 ]]; then
			arch=x86_64
		elif [[ "$(uname -m)" == x86_64 ]]; then
			arch=arm64e
		fi
		exec arch -arch $arch /bin/zsh
	}
fi

# mkdirとcdを同時実行
function mkcd() {
	if [[ -d $1 ]]; then
		echo "$1 already exists!"
		cd $1
	else
		mkdir -p $1 && cd $1
	fi
}

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
zstyle ':completion::complete:*' use-cache true
precmd () { vcs_info }

# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-completions)

# git の current branch出すやつ
source ~/.zsh/git-prompt.sh
# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST

# kubectl の補完を効くようにするやつ
# https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
source <(kubectl completion zsh)

export PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# KServe
export KO_DEFAULTPLATFORMS=linux/arm64
export KO_DOCKER_REPO="docker.io/$USER_NAME"

# tmux
# 初回シェル時のみ tmux実行
if [ $SHLVL = 1 ]; then
  tmux
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/s14958/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/s14958/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/s14958/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/s14958/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
