# -*- Makefile for fortune files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile


# You can configure where the bin goes
# /usr/local/bin is suggested
ifeq ($(BIN),)
BIN := /usr/local/bin/
endif

.PHONY: all
all: setup-login setup-bin docs completion
	@echo ""
	@echo "Fortunes Setup Complete"


.PHONY: setup-login
setup-login:
	@sudo bash -c "BIN=${BIN} source ${PWD}/setup.sh"

.PHONY: setup-bin
setup-bin:
	@${COPY} ${PWD}/fortune.sh ${BIN}/fortune


.PHONY: docs
docs: global-docs local-docs

.PHONY: local-docs
local-docs:
	@${COPY} ${PWD}/fortunes.txt ${HOME}/.fortunes

.PHONY: global-docs
global-docs:
	@sudo cp fortunes.txt /Library/Fortunes/


include ../completion.makefile










