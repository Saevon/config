#!/usr/bin/env bash

# Ask for the administrator password upfront
echo "This script edits system files (adding allowed shells, and changing default shells)"
sudo -k
sudo -v
if [ $? -ne 0 ]; then
	echo "sudo is required"
	exit 1
fi


brew install bash



# Update the allowed shells for bash
HAS_BASH=`cat /etc/shells | grep /usr/local/bin/bash`
if [ HAS_BASH == "bash" ]; then
	noop
else
	sudo echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
fi

# Update the user's default bash
chsh -s /usr/local/bin/bash

# Cleanup sudo privledges
sudo -k
