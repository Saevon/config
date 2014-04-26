#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


function rpl_icon {
	REQUIRE=$1
	ORIG_ICON=$2
	NEW_ICON=$3
	PROG_NAME=$4

	if [[ ! -f $NEW_ICON ]]; then
		echo "ERROR: New $PROG_NAME Icon Not Found ($NEW_ICON)"
		exit 1;
	fi

	if [[ -d  $REQUIRE ]]; then
		if [[ -f $ORIG_ICON ]]; then
			# Backup the old icon in case we need it
			LOC=`dirname "$ORIG_ICON"`
			sudo mkdir -p "$LOC/icon.bak/"
			sudo cp "$ORIG_ICON" "$LOC/icon.bak/"

			sudo cp "$NEW_ICON" "$ORIG_ICON"
		else
			echo "ERROR: $PROG_NAME Icon Not Found ($ORIG_ICON)."
		fi
	else
		echo "WARN: $PROG_NAME App Not Found ($REQUIRE)"
		exit 1;
	fi
}

function rpl_wrapper {
	rpl_icon "$REQ" "$REQ/Contents/Resources/$ICON" "./icons/$NEW" "$NAME"
}



###################################################
# Documents and Images
REQ="/Applications/Preview.app"
NAME="Images"

ICON="bmp.icns"
NEW="Documents/BMP.icns"
rpl_wrapper

ICON="gif.icns"
NEW="Documents/GIF.icns"
rpl_wrapper

ICON="jpeg.icns"
NEW="Documents/JPEG.icns"
rpl_wrapper

ICON="pdf.icns"
NEW="Documents/PDF.icns"
rpl_wrapper

ICON="png.icns"
NEW="Documents/PNG.icns"
rpl_wrapper

ICON="tga.icns"
NEW="Documents/TGA.icns"
rpl_wrapper

ICON="tiff.icns"
NEW="Documents/TIFF.icns"
rpl_wrapper


# ePub
REQ="/Applications/Kitabu.app"
ICON="Kitabu.icns"
NEW="Documents/ePub.icns"
NAME="ePub <Kitabu>"
rpl_wrapper
###################################################




###########A########################################
# Music

# iTunes
REQ="/Applications/iTunes.app"
ICON="iTunes.icns"
NEW="Music/iTunes.icns"
NAME="iTunes"
rpl_wrapper

# Misc Files
REQ="/Applications/iTunes.app"
NAME="Music"

ICON="iTunes-generic.icns"
NEW="Music/generic.icns"
rpl_wrapper

ICON="iTunes-mp3.icns"
NEW="Music/mp3.icns"
rpl_wrapper

ICON="iTunes-mpg.icns"
NEW="Music/mpg.icns"
rpl_wrapper

# ICON="iTunes-ogg.icns"
# NEW="Music/ogg.icns"
# rpl_wrapper

ICON="iTunes-wav.icns"
NEW="Music/wav.icns"
rpl_wrapper

# ICON="iTunes-wma.icns"
# NEW="Music/wma.icns"
# rpl_wrapper
###################################################




###################################################
# Misc Apps

# Calculator
REQ="/Applications/Calculator.app"
ICON="calculator.icns"
NEW="Calculator.icns"
NAME="Calculator"
rpl_wrapper

# Chrome
REQ="/Applications/Google Chrome.app"
ICON="app.icns"
NEW="Chrome Sleek.icns"
NAME="Chrome"
rpl_wrapper

# Console Logger
REQ="/Applications/Utilities/Console.app"
ICON="Console.icns"
NEW="Console Logs.icns"
NAME="Console"
rpl_wrapper

# Firefox
REQ="/Applications/Firefox.app"
ICON="firefox.icns"
NEW="FireFox.icns"
NAME="FireFox"
rpl_wrapper

# GitX
REQ="/Applications/GitX.app"
ICON="gitx.icns"
NEW="GitX.icns"
NAME="GitX"
rpl_wrapper


















