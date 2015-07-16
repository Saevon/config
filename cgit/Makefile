# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all:
	ln -i -s ${PWD}/git-completion.bash ${HOME}/.git-completion.bash || true
	ln -i -s ${PWD}/git-prompt.sh ${HOME}/.git-prompt.sh || true
	ln -i -s ${PWD}/gitconfig ${HOME}/.gitconfig || true
	ln -i -s ${PWD}/gitignore ${HOME}/.gitignore || true

	@echo ""
	@echo "Git Config Setup complete, If you didn't run the bash setup"
	@echo "Then the completion, and prompt scripts won't work"
	@echo "so watch out!"
