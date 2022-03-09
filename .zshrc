#日本語を使用
export LANG=ja_JP.UTF-8

# Common
export PATH="/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Node
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Deno
export PATH="$HOME/.deno/bin:$PATH"

# Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Docker
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# terminal color
export CLICOLOR=1

# Import other file
source $HOME/.bash_profile
source $HOME/.zshrc.kube

# git の current branch出すやつ
source /usr/local/etc/bash_completion.d/git-prompt.sh
# kubectl の補完を効くようにするやつ
source <(kubectl completion zsh)
# k8s　のクラスターとNamespaceを表示してくれるやつ
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

#alias一覧
alias reset='exec $SHELL -l'
alias k='kubectl'
alias h='fc -lt '%F %T' 1'
alias la='ls -a'
alias ll='ls -l'
alias sz='source ~/dotfiles/.zshrc'
alias h='cd ~/desktop'
alias d='docker'
alias dc='docker-compose'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias g='git'
alias ga='git add'
alias gi='git init'
alias gd='git diff'
alias gst='git status'
alias gp='git push origin HEAD'
alias gb='git branch'
alias gsw='git switch'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias path='echo $PATH'
alias w='which'
alias mongodb='mongod --config /usr/local/etc/mongod.conf'

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

# completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

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

# zsh-completionsの設定
autoload -U compinit && compinit -u

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mmomm/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mmomm/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mmomm/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mmomm/google-cloud-sdk/completion.zsh.inc'; fi

PROMPT='$(kube_ps1)'$PROMPT
