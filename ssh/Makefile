# -*- Makefile for ssh config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

CP=ln
CPI=${CP} -i

SSH_DIR = ${HOME}/.ssh

.PHONY: all
all: ${SSH_DIR}
	@${CPI} config ${SSH_DIR}/config || true

	@echo ""
	@echo "SSH configuration setup complete"


${SSH_DIR}:
	@mkdir -p $@

