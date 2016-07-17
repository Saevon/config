# -*- Makefile for vim config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

VIM_DIR=${HOME}/.vim/
CP=ln
CPI=${CP} -i

.PHONY: all
all: pre ${HOME}/.vimrc ${VIM_DIR} post

.PHONY: pre
pre:

.PHONY: post
post:
	@echo ""
	@echo "Vim Setup Config complete"

${HOME}/.vimrc: ${PWD}/vimrc
	${CPI} $? $@

${VIM_DIR}: ${PWD}/vim
	# TODO: Recursive Copy here
	ln -i -s $? $@

