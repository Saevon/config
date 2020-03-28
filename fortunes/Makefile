# -*- Makefile for fortune files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile


# You can configure where the bin goes
# /usr/local/bin is suggested
ifeq ($(BIN),)
BIN := /usr/local/bin/
endif

.PHONY: all
all: login setup-bin local-docs completion
	@echo ""
	@echo "Fortunes Setup Complete"

.PHONY: help
help:
	@echo "Saevon's Fortunes:"
	@echo "  This creates symbolic links to this folder's config files"
	@echo "  For the current user (using the $$HOME variable, so change that"
	@echo "  if you wish to install for another user)"
	@echo ""
	@echo "Commands"
	@echo "  binary:  Adds the binary to generate fortunes"
	@echo "  login:   Adds the daily login-screen message Service"


.PHONY: binary
binary: user-docs binary-setup


.PHONY: login
login: setup-login login-docs


.PHONY: setup-login
setup-login:
	@sudo bash -c "BIN=${BIN} source ${PWD}/setup.sh"


.PHONY: binary-setup
binary-setup:
	@${COPY} ${PWD}/fortune.sh ${BIN}/fortune


.PHONY: user-docs
user-docs:
	@${COPY} ${PWD}/fortunes.txt ${HOME}/.fortunes


.PHONY: login-docs
login-docs:
	@sudo ${COPY} ${PWD}/fortunes.txt /Library/Fortunes/.fortunes


include ../completion.makefile










