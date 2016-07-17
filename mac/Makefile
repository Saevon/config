# -*- Makefile for git config files -*-
# Copyright 2013 Saevon <saevon.kyomae@gmail.com>

.PHONY: all help config icon server server-bin python


all: server server-bin itunes config icon
	@echo "Suggested: XQuartz"
	@echo "Suggested: Haskell"
	@echo "Suggested: Java for OSX"
	@echo "Suggested: Change the hd nameJava for OSX"
	@echo ""
	@echo "Mac Customizations Complete"


help:
	@echo "icon:        updates the icons"
	@echo "config:      updates the config"
	@echo "itunes:      installs the itunes scripts"
	@echo "server:      changes the servername"
	@echo "server-bin:  installs the servername binary"
	@echo "hd:          renames the main drive"
	@echo "all:         updates everyhing"

icon:
	sudo bash -c "source ${PWD}/icons.sh"

config:
	sudo bash -c "source ${PWD}/config.sh"
	sudo ln -i -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

itunes:
	@if [ -e ${HOME}/Library/iTunes/Scripts ] ; \
	then \
		echo "iTunes Scripts folder exists, aborting" ; \
	else \
		ln -s ${PWD}/iTunes-Scripts ${HOME}/Library/iTunes/Scripts || true ; \
	fi

server:
	sudo bash -c "source ${PWD}/servername.sh"

hd:
	@read -p "What should the disk be called? " HD_NAME\
    && diskutil rename /dev/disk1 $${HD_NAME}

server-bin:
	@sudo cp -i ${PWD}/servername.sh /usr/bin/servername


# apps:
# 	brew cask install gimp
# 	brew cask install inkscape
# 	brew cask install xquartz

