# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile

.PHONY: all
all: ${USR_SCRIPT}
	# TODO: add git prompt
	#${COPY} "${PWD}/git-prompt.sh" "${USR_SCRIPT}/git-prompt.sh"
	@${COPY} "${PWD}/gitconfig" "${HOME}/.gitconfig"
	@${COPY} "${PWD}/gitignore" "${HOME}/.gitignore"

	@echo ""
	@echo "Git Config Setup complete, If you didn't run the bash setup"
	@echo "Then the completion, and prompt scripts won't work"
	@echo "so watch out!"


include ../completion.makefile
