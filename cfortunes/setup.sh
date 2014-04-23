#!/bin/bash

MAIN="/Library/Fortunes"
DAEMONS="/Library/LaunchDaemons"

MAIN_SH="fortune.sh"
DAEMON_SH="login_fortune.sh"
PLIST="com.saevon.fortunes.plist"
TXT="fortunes.txt"

# Setup up the folder to store all the fortunes data
sudo mkdir -p ${MAIN}

# First we need to setup the fortunes binary
sudo cp ${PWD}/${MAIN_SH} ${MAIN}/
sudo chmod +x ${MAIN}/${MAIN_SH}

# Copy over the fortunes document
sudo cp ${PWD}/${TXT} ${MAIN}/
sudo chmod +x ${MAIN}/${TXT}

# Now we setup the login message daemon executable
sudo cp ${PWD}/${DAEMON_SH} ${MAIN}/
sudo chmod +x ${MAIN}/${DAEMON_SH}

# Now we setup LaunchDaemon
sudo cp ${PWD}/${PLIST} ${DAEMONS}/

# Make sure to add this right now so we don't require a restart
sudo launchctl unload -w ${DAEMONS}/${PLIST} || true
sudo launchctl load -w ${DAEMONS}/${PLIST}

