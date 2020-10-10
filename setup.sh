set -euo pipefail

source lib/echos.sh

function command_exists() {
  type "$1" &> /dev/null ;
}

: "install brew" && {
  if ! command_exists brew; then
    info "installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    warn "brew is already installed"
  fi
}

: "install zsh by brew" && {
  BREW_ZSH_PATH="/usr/local/bin/zsh"
  if ! brew list | grep zsh &> /dev/null; then
    info "installing zsh..."
    brew install zsh zsh-completions
    sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells'
    chsh -s $(brew --prefix)/bin/zsh
  else
    warn "zsh is already installed"
  fi
}

: "install other packages by brew" && {
  packages=( peco ghq jq tree wget autojump direnv colordiff \
    coreutils diffutils findutils )
  for package in ${packages[@]}; do
    if ! brew list | grep $package &> /dev/null; then
      info "installing ${package}..."
      brew install ${package}
    else
      warn "${package} is already installed"
    fi
  done
}

: "install zplug" && {
  ZPLUG_DIR=$HOME/.zplug
  if [ ! -e $ZPLUG_DIR ]; then
    info "installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  else
    warn "zplug is already installed"
  fi
}

: "install anyenv" && {
  if [ ! -e $HOME/.anyenv ]; then
    git clone https://github.com/riywo/anyenv ~/.anyenv
  fi
}

ok "Complete!"