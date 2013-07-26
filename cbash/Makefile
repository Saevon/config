# -*- Makefile for bash config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all:
	ln -i -s ${PWD}/bashrc ${HOME}/.bashrc
	ln -i -s ${PWD}/bash_profile ${HOME}/.bash_profile

	ln -i -s ${PWD}/bash_helpers ${HOME}/.bash_helpers
	ln -i -s ${PWD}/bash_aliases ${HOME}/.bash_aliases

	mkdir -p ${HOME}/bin
	ln -i -s ${PWD}/fortune ${HOME}/bin/fortune
	ln -i -s ${PWD}/fortunes ${HOME}/.fortunes

	@echo ""
	@echo "Bash Setup complete"
