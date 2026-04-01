DOTFILES_GITHUB   := git@github.com:mmmommm/dotfiles.git
DOTFILES_EXCLUDES := .DS_Store .git .gitignore .claude .vscode
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

.PHONY: setup
setup: brew install

.PHONY: brew
brew:
	@command -v brew >/dev/null 2>&1 || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle

.PHONY: install
install:
	@echo 'Start deploying dotfiles to home directory.'
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

.PHONY: list
list:
	@$(foreach val, $(DOTFILES_FILES), echo $(val);)

.PHONY: clean
clean:
	@echo 'Removing symlinks from home directory.'
	@$(foreach val, $(DOTFILES_FILES), rm -vf $(HOME)/$(val);)

.PHONY: prezto
prezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$${ZDOTDIR:-$$HOME}/.zprezto"

.PHONY: backup
backup:
	brew bundle dump --file=Brewfile --force

.PHONY: help
help:
	@echo 'Available targets:'
	@echo '  setup   - Install Homebrew, packages, and deploy dotfiles'
	@echo '  brew    - Install Homebrew and run brew bundle'
	@echo '  install - Symlink dotfiles to home directory'
	@echo '  list    - List dotfiles that will be symlinked'
	@echo '  clean   - Remove symlinks from home directory'
	@echo '  prezto  - Install Prezto (Zsh framework)'
	@echo '  backup  - Export current Homebrew packages to Brewfile'
	@echo '  help    - Show this help message'
