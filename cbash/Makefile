# -*- Makefile for bash config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

UNAME=$(shell uname)

.PHONY: all misc python
all: misc python

misc:
	@ln -i -s ${PWD}/bashrc ${HOME}/.bashrc || true

ifeq ($(UNAME),Darwin)
	@ln -i -s ${PWD}/bash_profile ${HOME}/.bash_profile || true
endif

	@ln -i -s ${PWD}/bash_helpers ${HOME}/.bash_helpers || true
	@ln -i -s ${PWD}/bash_aliases ${HOME}/.bash_aliases || true
	@ln -i -s ${PWD}/pauser.sh ${HOME}/.pauser.sh || true
	@cp -i ${PWD}/pauser_template.sh ${HOME}/.pauser.custom.sh || true

	mkdir -p ~/.bin

	@echo "Copying binaries to /usr/local"
	sudo -v

ifeq ($(UNAME),Darwin)
	@sudo cp -i ${PWD}/changeInput /bin/ || true
endif

	@sudo cp -i ${PWD}/cputhrottle /usr/local/bin/ || true
	@sudo cp -i ${PWD}/ack /usr/local/bin/ || true

ifeq ($(UNAME),Darwin)
	@cp -i ${PWD}/itunes.sh ~/.bin/itunes || true
endif

	@echo ""
	@echo "Bash Setup complete"


python:
	@sudo easy_install pip
	@sudo cp -i ${PWD}/syspip /usr/local/bin/ || true

	@syspip install eyeD3
	@syspip install bottle
	@syspip install virtualenv
	@syspip install virtualenvwrapper
