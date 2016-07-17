#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

read -p "What should the server name be? " SERVER_NAME

##################################################
# General UI/UX
##################################################

sudo scutil --set ComputerName "${SERVER_NAME}"
sudo scutil --set HostName "${SERVER_NAME}"
sudo scutil --set LocalHostName "${SERVER_NAME}"

exit 0
