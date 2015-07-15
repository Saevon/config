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

	@echo "Copying binaries to /usr/local"
	sudo -v

	@sudo cp -i ${PWD}/changeInput /bin/ || true
	@sudo cp -i ${PWD}/cputhrottle /usr/local/bin/ || true
	@sudo cp -i ${PWD}/ack /usr/local/bin/ || true

	@cp -i ${PWD}/itunes.sh ~/.bin/itunes || true

	@echo ""
	@echo "Bash Setup complete"
