# -*- Makefile for bash config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all:
	@ln -i -s ${PWD}/bashrc ${HOME}/.bashrc || true
	@ln -i -s ${PWD}/bash_profile ${HOME}/.bash_profile || true

	@ln -i -s ${PWD}/bash_helpers ${HOME}/.bash_helpers || true
	@ln -i -s ${PWD}/bash_aliases ${HOME}/.bash_aliases || true
	@ln -i -s ${PWD}/pauser.sh ${HOME}/.pauser.sh || true
	@cp -i ${PWD}/pauser_template.sh ${HOME}/.pauser.custom.sh || true

	mkdir -p ~/.bin

	@cp -i ${PWD}/ack ~/.bin/ack || true
	chmod +x ~/.bin/ack

	@sudo cp -i ${PWD}/changeInput /bin/changeInput || true
	sudo chmod +x /bin/changeInput

	@cp -i ${PWD}/itunes.sh ~/.bin/itunes || true
	chmod +x ~/.bin/itunes

	@cp -i ${PWD}/cputhrottle ~/.bin/cputhrottle || true
	chmod +x ~/.bin/cputhrottle

	@echo ""
	@echo "Bash Setup complete"
