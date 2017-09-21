# -*- Makefile for ssh config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

include ../variables.makefile

SSH_DIR = ${HOME}/.ssh

.PHONY: all
all: ${SSH_DIR}
	@${COPY} "${PWD}/config" "${SSH_DIR}/config"

	@echo ""
	@echo "SSH configuration setup complete"

work: ${SSH_DIR}
	@${COPY} "${PWD}/work_config" "${SSH_DIR}/config"

	@echo ""
	@echo "SSH configuration setup complete"


${SSH_DIR}:
	@mkdir -p $@

