#!/usr/bin/env bash

DAEMONS="/Library/LaunchDaemons"
MAIN="/Library/Fortunes"

DAEMON_SH="login_fortune.sh"
PLIST="com.saevon.fortunes.plist"
TXT="fortunes.txt"

if [ "$(uname)" == "Darwin" ]; then

	# Setup up the folder to store all the fortunes data
	sudo mkdir -p ${MAIN}

	# Copy over the fortunes document
	sudo cp ${PWD}/${TXT} ${MAIN}/

	# Now we setup the login message daemon executable
	sudo cp ${PWD}/${DAEMON_SH} ${MAIN}/

	# Now we setup LaunchDaemon
	sudo cp ${PWD}/${PLIST} ${DAEMONS}/
	sudo chown root:wheel ${DAEMONS}/${PLIST}

	# Make sure to add this right now so we don't require a restart
	sudo launchctl unload -w ${DAEMONS}/${PLIST}  >/dev/null 2>&1 || true
	sudo launchctl load -w ${DAEMONS}/${PLIST}
fi

# Start with a login message right away
if [ "$(uname)" == "Darwin" ]; then
	fortune --login-msg
fi
