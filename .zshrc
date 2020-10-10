# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/mmomm/.oh-my-zsh"
#日本語を使用
export LANG=ja_JP.UTF-8

#environmental paths
#.bashrcのやつをコピー
export PATH=/Users/mmomm/.nodebrew/current/bin:/Users/mmomm/.rbenv/bin:/Users/mmomm/.rbenv/shims:/Users/mmomm/.rbenv/bin:/Users/mmomm/.rbenv/shims:/Users/mmomm/.rbenv/bin:/Users/mmomm/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/local/.npm-global/bin/:/Users/local/.npm-global/bin/:/Users/local/.npm-global/bin/:/Users/local/.npm-global/bin/:/Users/local/.npm-global/bin/:/Users/local/.npm-global/bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

ZSH_THEME="candy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

#alias一覧
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias la='ls -a'
alias ll='ls -l'
alias sz='source ~/dotfiles/.zshrc'
alias h='cd ~/desktop'
alias d='docker'
alias dc='docker-compose'
alias dopen='open /Applications/Docker.app'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias g='git'
alias ga='git add'
alias gi='git init'
alias gd='git diff'
alias gs='git status'
alias gp='git push origin HEAD'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'
alias gfirst='git remote add origin'
alias m='mkdir'
alias path='echo $PATH'
alias w='which'
alias serve='npm run serve'


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
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# beepを鳴らさないようにする
setopt nolistbeep
# 余分な空白は詰める
setopt hist_reduce_blanks
# ctrl-w, ctrl-bキーで単語移動
bindkey "^W" forward-word
bindkey "^B" backward-word
# 重複する履歴は古い方を削除
  setopt hist_ignore_all_dups
# 直前と同じコマンドラインはヒストリに記録しない
  setopt hist_ignore_dups

# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }

# mkdirとcdを同時実行
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}


# bindkey '\^' cdup


# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-completions)

# zsh-completionsの設定
autoload -U compinit && compinit -u
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

# function tmux_automatically_attach_session()
# {
#     if is_screen_or_tmux_running; then
#         ! is_exists 'tmux' && return 1

#         if is_tmux_runnning; then
#             echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
#             echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
#             echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
#             echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
#             echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
#         elif is_screen_running; then
#             echo "This is on screen."
#         fi
#     else
#         if shell_has_started_interactively && ! is_ssh_running; then
#             if ! is_exists 'tmux'; then
#                 echo 'Error: tmux command not found' 2>&1
#                 return 1
#             fi

#             if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
#                 # detached session exists
#                 tmux list-sessions
#                 echo -n "Tmux: attach? (y/N/num) "
#                 read
#                 if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
#                     tmux attach-session
#                     if [ $? -eq 0 ]; then
#                         echo "$(tmux -V) attached session"
#                         return 0
#                     fi
#                 elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
#                     tmux attach -t "$REPLY"
#                     if [ $? -eq 0 ]; then
#                         echo "$(tmux -V) attached session"
#                         return 0
#                     fi
#                 fi
#             fi

#             if is_osx && is_exists 'reattach-to-user-namespace'; then
#                 # on OS X force tmux's default command
#                 # to spawn a shell in the user's namespace
#                 tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
#                 tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
#             else
#                 tmux new-session && echo "tmux created new session"
#             fi
#         fi
#     fi
# }
# tmux_automatically_attach_session
