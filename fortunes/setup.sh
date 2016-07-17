#!/bin/bash

MAIN="/Library/Fortunes"
DAEMONS="/Library/LaunchDaemons"
BIN="/usr/bin/fortune"

MAIN_SH="fortune.sh"
DAEMON_SH="login_fortune.sh"
PLIST="com.saevon.fortunes.plist"
TXT="fortunes.txt"

if [ "$(uname)" == "Darwin" ]; then

	# Setup up the folder to store all the fortunes data
	sudo mkdir -p ${MAIN}

	# Copy over the fortunes document
	sudo cp ${PWD}/${TXT} ${MAIN}/
    ln -s ${PWD}/${TXT} ${HOME}/.fortunes

	# Now we setup the login message daemon executable
	sudo cp ${PWD}/${DAEMON_SH} ${MAIN}/

	# Now we setup LaunchDaemon
	sudo cp ${PWD}/${PLIST} ${DAEMONS}/
	sudo chown root:wheel ${DAEMONS}/${PLIST}

	# Make sure to add this right now so we don't require a restart
	sudo launchctl unload -w ${DAEMONS}/${PLIST} || true
	sudo launchctl load -w ${DAEMONS}/${PLIST}
fi

# Add the fortunes binary
sudo cp ${PWD}/${MAIN_SH} ${BIN}
chmod o+rx ${BIN}

# Start with a login message right away
if [ "$(uname)" == "Darwin" ]; then
	fortune --login-msg
fi