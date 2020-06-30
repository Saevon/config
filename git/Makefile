# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile

.PHONY: all
all: ${USR_SCRIPT} completion
	@${COPY} "${PWD}/gitconfig" "${HOME}/.gitconfig"
	@${COPY} "${PWD}/gitignore" "${HOME}/.gitignore"
	@ln -s "${PWD}/git-templates" "${HOME}/.git-templates"

	@# TODO: add git prompt
	@#${COPY} "${PWD}/git-prompt.sh" "${USR_SCRIPT}/git-prompt.sh"

	@echo ""
	@echo "Git Config Setup complete, If you didn't run the bash setup"
	@echo "Then the completion, and prompt scripts won't work"
	@echo "so watch out!"

.PHONY: plugins
plugins:
ifeq ($(UNAME),Darwin)
	@brew install diff-so-fancy
endif
	@npm install --global git-open

.PHONY: reset
reset: reset-completion
	@rm -i ${HOME}/.gitconfig || true
	@rm -i ${HOME}/.gitignore || true


include ../completion.makefile
