# -*- Makefile for vim config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

VIM_DIR=${HOME}/.vim/
CP=ln
CPI=${CP} -i

.PHONY: all
all: ${VIM_DIR}
	@${CPI} ${PWD}/vimrc ${HOME}/.vimrc || true

	@echo ""
	@echo "Vim Setup Config complete"

${VIM_DIR}:
	# TODO: Recursive Copy here
	ln -i -s ${PWD}/vim $@

