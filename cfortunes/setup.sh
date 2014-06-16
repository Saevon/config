#!/bin/bash

MAIN="/Library/Fortunes"
DAEMONS="/Library/LaunchDaemons"
BIN="/usr/bin/fortune"

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

# Now we setup the login message daemon executable
sudo cp ${PWD}/${DAEMON_SH} ${MAIN}/
sudo chmod +x ${MAIN}/${DAEMON_SH}

# Now we setup LaunchDaemon
sudo cp ${PWD}/${PLIST} ${DAEMONS}/

# Make sure to add this right now so we don't require a restart
sudo launchctl unload -w ${DAEMONS}/${PLIST} || true
sudo launchctl load -w ${DAEMONS}/${PLIST}

# Also make sure to add a link to the /usr/bin/
if [[ -a ${BIN} ]]; then
    echo "  Warning: File exists ${BIN}"
else
    sudo ln -s ${MAIN}/${MAIN_SH} ${BIN}
fi
