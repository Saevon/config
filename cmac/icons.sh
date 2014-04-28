#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


function backup {
	REQUIRE=$1
	ICON=$2
	PROG_NAME=$3

	ICON_NAME=`basename $ICON`
	LOC=`dirname "$ICON"`
	BAK="$LOC/icon.bak"
	BAK_ICON="$BAK/$ICON_NAME"

	if [[ -d  $REQUIRE ]]; then
		if [[ -f $BAK_ICON ]]; then
			# already backed up!
			return 0;
		fi

		if [[ -f $ICON ]]; then
			# Backup the old icon in case we need it
			sudo mkdir -p "$BAK"
			sudo mv "$ICON" "$BAK_ICON"
		else
			echo "ERROR: $PROG_NAME Icon Not Found ($ICON)."
			return 2;
		fi
	else
		echo "WARN: $PROG_NAME App Not Found ($REQUIRE)"
		return 1;
	fi
}

function rpl_icon {
	REQUIRE=$1
	ORIG_ICON=$2
	NEW_ICON=$3
	PROG_NAME=$4

	backup "$REQUIRE" "$ORIG_ICON" "$NAME"
	if [[ $? == 1 ]]; then
		return 1;
	else
		sudo cp "$NEW_ICON" "$ORIG_ICON"
	fi
}

function rpl_app {
	rpl_icon "$REQ" "$REQ/Contents/Resources/$ICON" "./icons/$NEW" "$NAME"
}
function backup_app {
	backup "$REQ" "$REQ/Contents/Resources/$ICON" "$NAME"
}



###################################################
# Documents and Images
REQ="/Applications/Preview.app"
NAME="Images"

ICON="bmp.icns"
NEW="Documents/BMP.icns"
rpl_app

ICON="gif.icns"
NEW="Documents/GIF.icns"
rpl_app

ICON="jpeg.icns"
NEW="Documents/JPEG.icns"
rpl_app

ICON="pdf.icns"
NEW="Documents/PDF.icns"
rpl_app

ICON="png.icns"
NEW="Documents/PNG.icns"
rpl_app

ICON="tga.icns"
NEW="Documents/TGA.icns"
rpl_app

ICON="tiff.icns"
NEW="Documents/TIFF.icns"
rpl_app


# ePub
REQ="/Applications/Kitabu.app"
ICON="Kitabu.icns"
NEW="Documents/ePub.icns"
NAME="ePub <Kitabu>"
rpl_app
###################################################




###########A########################################
# Music

# iTunes
REQ="/Applications/iTunes.app"
ICON="iTunes.icns"
NEW="Music/iTunes.icns"
NAME="iTunes"
rpl_app

# Misc Files
REQ="/Applications/iTunes.app"
NAME="Music"

ICON="iTunes-generic.icns"
NEW="Music/generic.icns"
rpl_app

ICON="iTunes-mp3.icns"
NEW="Music/mp3.icns"
rpl_app

ICON="iTunes-mpg.icns"
NEW="Music/mpg.icns"
rpl_app

# ICON="iTunes-ogg.icns"
# NEW="Music/ogg.icns"
# rpl_app

ICON="iTunes-wav.icns"
NEW="Music/wav.icns"
rpl_app

# ICON="iTunes-wma.icns"
# NEW="Music/wma.icns"
# rpl_app
###################################################




###################################################
# Misc Apps

# Calculator
REQ="/Applications/Calculator.app"
ICON="calculator.icns"
NEW="Calculator.icns"
NAME="Calculator"
rpl_app

# Chrome
REQ="/Applications/Google Chrome.app"
ICON="app.icns"
NEW="Chrome Sleek.icns"
NAME="Chrome"
rpl_app

# Console Logger
REQ="/Applications/Utilities/Console.app"
ICON="Console.icns"
NEW="Console Logs.icns"
NAME="Console"
rpl_app

# Firefox
REQ="/Applications/Firefox.app"
ICON="firefox.icns"
NEW="FireFox.icns"
NAME="FireFox"
rpl_app

# GitX
REQ="/Applications/GitX.app"
ICON="gitx.icns"
NEW="GitX.icns"
NAME="GitX"
rpl_app













# Now restart the Dock and Finder after these changes
sudo killall Dock
sudo killall Finder





