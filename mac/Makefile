# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all
all: server server-bin itunes config icon
	@echo "Suggested: XQuartz"
	@echo "Suggested: Haskell"
	@echo "Suggested: Java for OSX"
	@echo "Suggested: Change the hd  for OSX"
	@echo ""
	@echo "Mac Customizations Complete"

minimal: server itunes config icon


.PHONY: help
help:
	@echo "icon:        updates the icons"
	@echo "config:      updates the config"
	@echo "itunes:      installs the itunes scripts"
	@echo "server:      changes the servername"
	@echo "server-bin:  installs the servername binary"
	@echo "login-screen changes the login screen"
	@echo "hd:          renames the main drive"
	@echo "all:         updates everyhing"

.PHONY: icon
icon:
	@sudo bash -c "source ${PWD}/icons.sh"

.PHONY: config
config:
	@sudo bash -c "source ${PWD}/config.sh"

.PHONY: itunes
itunes:
	@if [ -e ${HOME}/Library/iTunes/Scripts ] ; \
	then \
		echo "iTunes Scripts folder exists, aborting" ; \
	else \
		ln -s ${PWD}/iTunes-Scripts ${HOME}/Library/iTunes/Scripts || true ; \
	fi

.PHONY: server
server:
	@sudo bash -c "source ${PWD}/servername.sh"

.PHONY: hd
hd:
	@read -p "What should the disk be called? " HD_NAME\
    && diskutil rename /dev/disk1 $${HD_NAME}

.PHONY: server-bin
server-bin:
	@sudo cp -i ${PWD}/servername.sh /usr/local/bin/servername




.PHONY: login-screen
login-screen:
	@sudo ./login_back.sh Backgrounds/Login-Background.jpg
	@echo "If using a newer mac: this is overwritten if you change your desktop... so run this again"

# apps:
# 	brew cask install gimp
# 	brew cask install inkscape
# 	brew cask install xquartz

