# -*- Makefile for bash config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all:
	@ln -i -s ${PWD}/bashrc ${HOME}/.bashrc || true
	@ln -i -s ${PWD}/bash_profile ${HOME}/.bash_profile || true

	@ln -i -s ${PWD}/bash_helpers ${HOME}/.bash_helpers || true
	@ln -i -s ${PWD}/bash_aliases ${HOME}/.bash_aliases || true

	mkdir -p ~/.bin

	@cp -i ${PWD}/ack ~/.bin/ack || true
	chmod +x ~/.bin/ack

	@echo ""
	@echo "Bash Setup complete"
