readonly RED=$(tput setaf 1)
readonly GREEN=$(tput setaf 2; tput bold)
readonly YELLOW=$(tput setaf 3)
readonly CYAN=$(tput setaf 6)
readonly NORMAL=$(tput sgr0)

function ok() {
  printf "%s\n" "$GREEN$1$NORMAL"
}

function info() {
  printf "%s\n" "$CYAN$1$NORMAL"
}

function warn() {
  printf "%s\n" "$YELLOW$1$NORMAL"
}

function fail() {
  printf "%s\n" "$RED$1$NORMAL"
}