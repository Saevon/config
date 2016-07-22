# -*- Makefile for fortune files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile

.PHONY: all
all: docs completion
	@sudo bash -c "source ${PWD}/setup.sh"

	@echo ""
	@echo "Fortunes Setup Complete"

docs:
	@${COPY} fortunes.txt ${HOME}/.fortunes
	@sudo cp fortunes.txt /Library/Fortunes/


include ../completion.makefile










