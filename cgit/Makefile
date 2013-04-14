# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all:
	ln -i -s ${PWD}/git-completion.bash ${HOME}/.git-completion.bash
	ln -i -s ${PWD}/git-prompt.sh ${HOME}/.git-prompt.sh

	@# Run any setup commands
	@# most of these are git-config commands
	${PWD}/git_setup.bash

	@echo ""
	@echo "Git Config Setup complete, If you didn't run the bash setup"
	@echo "Then the completion, and prompt scripts won't work"
	@echo "so watch out!"
