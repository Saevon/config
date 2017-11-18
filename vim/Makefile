# -*- Makefile for vim config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

VIM_DIR=${HOME}/.vim/
CP=ln -s
CPI=${CP} -i

.PHONY: all
all: ${VIM_DIR}
	@${CPI} ${PWD}/vimrc ${HOME}/.vimrc || true

	@echo ""
	@echo "Vim Setup Config complete"

${VIM_DIR}:
	# TODO: Recursive Copy here
	ln -i -s ${PWD}/vim $@

# Check if vim is properly installed
# Will error if it isn't
clipboard-check:
	@vim --version | grep -q '\+clipboard'; if [[ $$? == 1 ]]; then 1>&2 echo 'vim clipboard is not installed'; exit 1; fi
