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
