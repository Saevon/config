# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all help config

help:
	@echo "icon:    updates the icons"
	@echo "config:  updates the config"
	@echo "all:     updates everyhing"

icon:
	sudo bash -c "source ${PWD}/icons.sh"

config:
	sudo bash -c "source ${PWD}/mac.sh"
	sudo ln -i -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl



all: config icon
	@echo ""
	@echo "Mac Customizations Complete"











