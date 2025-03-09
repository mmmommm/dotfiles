# 日本語を使用
export LANG=ja_JP.UTF-8
export USER_NAME=mmomm

# Common
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$PATH"

if [ -d "/opt/homebrew/bin" ]; then
  PATH="/opt/homebrew/bin:$PATH"
fi

# Java
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# Ansible
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOPRIVATE="github.com/cycloud-io,github.com/CyberAgent,github.com/mmmommm"
if [ "$(uname)" == 'Darwin' ]; then
  export GOROOT=/usr/local/go
fi
# export GOROOT=/usr/local/go
# export PATH=$PATH:/usr/local/go/bin
export GO111MODULE=on
export GOBIN=$(go env GOPATH)/bin
if [ "$(uname)" == 'Darwin' ]; then
  export PATH=$PATH:$GOBIN
fi
export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"

# Node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Python installed by [uv](https://github.com/astral-sh/uv)

# Docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# Istio
export PATH="$HOME/.istioctl/bin:$PATH"

# terminal color
export CLICOLOR=1

export USE_GKE_GCLOUD_AUTH_PLUGIN=true

# Kubernetes
export KUBERNETES_MASTER=$HOME/.kube/config

# KServe
export KO_DEFAULTPLATFORMS=linux/arm64
export KO_DOCKER_REPO="docker.io/$USER_NAME"
export KSERVE_ENABLE_SELF_SIGNED_CA=true

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# シークレットファイルを読み込む
# [ -f $HOME/dotfiles/.bashrc.local ] && source $HOME/dotfiles/.bashrc.local

# alias 一覧
alias reset='exec $SHELL -l'
alias k='kubectl'
alias la='ls -a'
alias ll='ls -l'
alias sz='source ~/.bashrc'
alias home='cd ~/'
alias d='docker'
alias dc='docker-compose'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias g='git'
alias path='echo $PATH'
alias w='which'
alias mongodb='mongod --config /usr/local/etc/mongod.conf'
alias rck='kubectl run kise-curl --image=curlimages/curl -i --tty --rm -- sh'
alias rdk='kubectl run kise-dig --image=tutum/dnsutils -i --tty --rm -- sh'
alias rrk='kubectl run kise-redis --image redis:latest -it --rm -- bash'
alias mergekubeconf='KUBECONFIG=~/.kube/config.backup:~/.kube/config-gpuaas:~/.kube/config-ml kubectl config view --merge --flatten > ~/.kube/config'
alias copykubeconf='cp ~/.kube/config{,.backup}'

# プロンプトの設定
PS1='\[\e[32m\]\u@\h\[\e[0m\]: \[\e[36m\]\w\[\e[0m\] \[\e[31m\]$(__git_ps1 "(%s)")\[\e[0m\]\$ '

# コマンドの補完を有効化
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# history
HISTSIZE=500000
SAVEHIST=500000
HISTFILE=~/.bash_history
shopt -s histappend
export HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit"

# mkdir と cd を同時実行
function mkcd() {
    if [[ -d $1 ]]; then
        echo "$1 already exists!"
        cd "$1"
    else
        mkdir -p "$1" && cd "$1"
    fi
}

# Git プロンプト
if [ -f ~/.bash/git-prompt.sh ]; then
    source ~/.bash/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWUNTRACKEDFILES=true
    export GIT_PS1_SHOWSTASHSTATE=true
    export GIT_PS1_SHOWUPSTREAM=auto
fi

# kubectl の補完を有効化
source <(kubectl completion bash)

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then
    . "$HOME/google-cloud-sdk/path.bash.inc"
fi

if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then
    . "$HOME/google-cloud-sdk/completion.bash.inc"
fi

# asdf
if [ "$(uname)" == 'Darwin' ]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# KServe
export KO_DEFAULTPLATFORMS=linux/arm64
export KO_DOCKER_REPO="docker.io/$USER_NAME"

# 初回シェル時のみ tmux 実行
if [[ $SHLVL -eq 1 ]]; then
  tmux
fi
