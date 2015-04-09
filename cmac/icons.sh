#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source replace_icon.sh

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
REQ="/Applications/Readers/Kitabu.app"
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

# Gimp
REQ="/Applications/Gimp.app"
ICON="gimp.icns"
NEW="Gimp.icns"
NAME="Gimp"
rpl_app
ICON="xcf.icns"
NEW="xcf.icns"
rpl_app

# Console Logger
REQ="/Applications/Utilities/Console.app"
ICON="Console.icns"
NEW="Console Logs.icns"
NAME="Console"
rpl_app

# Terminal
REQ="/Applications/Utilities/Terminal.app"
ICON="Terminal.icns"
NEW="Shell.icns"
NAME="Terminal"
rpl_app

# Firefox
REQ="/Applications/Firefox.app"
ICON="firefox.icns"
NEW="Firefox.icns"
NAME="FireFox"
rpl_app

# GitX
REQ="/Applications/GitX.app"
ICON="gitx.icns"
NEW="GitX.icns"
NAME="GitX"
rpl_app





# Trash Icons
REQ="/System/Library/CoreServices/Dock.app"
NAME="Trash"


NEW="./Trash Set/Trash ~ Full.png"
ICON="trashfull.png"
rpl_app
ICON="trashfull@2x.png"
rpl_app

ICON="trashfullreflection.png"
backup_app
ICON="trashfullreflection@2x.png"
backup_app


NEW="./Trash Set/Trash ~ Empty.png"
ICON="trashempty.png"
rpl_app
ICON="trashempty@2x.png"
rpl_app

ICON="trashemptyreflection.png"
backup_app
ICON="trashemptyreflection@2x.png"
backup_app


#######################
# Steam
##################
REQ="/Applications/Games/Steam.app"
ICON="Steam.icns"
NEW="Steam.icns"
NAME="Steam"
rpl_app

NAME="SteamGames"
ICON="shortcut.icns"

REQ="$HOME/Applications/Steam/Bastion.app"
NEW="Games/Bastion.icns"
ICON="shortcut.icns"
rpl_app
REQ="$HOME/Applications/Steam/VVVVVV.app"
NEW="Games/VVVVVV.icns"
ICON="shortcut.icns"
rpl_app
REQ="$HOME/Applications/Steam/Transistor.app"
NEW="Games/Transistor.icns"
ICON="shortcut.icns"
rpl_app
REQ="$HOME/Applications/Steam/Plague Inc Evolved.app"
NEW="Games/PlagueInc.icns"
ICON="shortcut.icns"
rpl_app



REQ="$HOME/Library/Application Support/Steam/steamapps/common/vvvvvv/VVVVVV.app"
NEW="Games/VVVVVV.icns"
ICON="VVVVVV.icns"
rpl_app


#######################
# User Folders
####################
replace_icon ~/Desktop ./icons/User/Desktop.icns
replace_icon ~/Downloads ./icons/User/Downloads.icns
replace_icon ~/Movies ./icons/User/Movies.icns
replace_icon ~/Music ./icons/User/Music.icns
replace_icon ~/Pictures ./icons/User/Pictures.icns
replace_icon ~/Projects ./icons/User/Projects.icns
replace_icon ~/Applications ./icons/System/Applications.icns
replace_icon ~/Documents ./icons/Documents/PDF.icns

##################
# Xtra Finder icons
REQ="/System/Library/CoreServices/CoreTypes.bundle"
NAME="Finder"

# Misc
NEW="./Help.icns"
ICON="HelpIcon.icns"
rpl_app

NEW="./Apple.icns"
ICON="HomeFolderIcon.icns"
rpl_app
NEW="./System/AirDrop.icns"
ICON="AirDrop.icns"
rpl_app
NEW="./System/Burning Disk.icns"
ICON="BurningIcon.icns"
rpl_app
NEW="./User/Downloads.icns"
ICON="DownloadsFolder.icns"
rpl_app
ICON="ToolbarDownloadsFolderIcon.icns"
rpl_app
NEW="./Documents/PDF.icns"
ICON="DocumentsFolderIcon.icns"
rpl_app
ICON="ToolbarDocumentsFolderIcon.icns"
rpl_app
NEW="./User/Movies.icns"
ICON="ToolbarMovieFolderIcon.icns"
rpl_app
NEW="./User/Pictures.icns"
ICON="PicturesFolderIcon.icns"
rpl_app
ICON="ToolbarPicturesFolderIcon.icns"
rpl_app
NEW="./System/Applications.icns"
ICON="ToolbarAppsFolderIcon.icns"
rpl_app
NEW="./User/Music.icns"
ICON="ToolbarMusicFolderIcon.icns"
rpl_app
NEW="./User/Desktop.icns"
ICON="ToolbarDesktopFolderIcon.icns"
rpl_app

# Trash folder icons (When Open)
NEW="./Trash Set/Trash ~ Full.icns"
ICON="FullTrashIcon.icns"
rpl_app
NEW="./Trash Set/Trash ~ Empty.icns"
ICON="TrashIcon.icns"

# Drive Icons
NEW="./HardDrives/airport.icns"
ICON="GenericAirDiskIcon.icns"
rpl_app
NEW="./HardDrives/time-machine.icns"
ICON="GenericTimeMachineDiskIcon.icns"
rpl_app
NEW="./HardDrives/mobileme.icns"
ICON="iDiskGenericIcon.icns"
rpl_app
NEW="./HardDrives/mobileme.icns"
ICON="iDiskUserIcon.icns" # Perhaps this should be unique?
rpl_app



# Replace Volume Icons
#replace_icon /Volumes/Aeria ./icons/HardDrives/apple.icns
#if [ -d "/Volumes/Chronos/" ]; then
#    replace_icon /Volumes/Chronos ./icons/HardDrives/time-machine.icns
#fi
#if [ -d "/Volumes/Solarius/" ]; then
#    replace_icon /Volumes/Solarius ./icons/HardDrives/usb.icns
#fi





# Ask whether to restart
read -p "Should we reset? [y/n]: " reset

if [[ "$reset" == "y" ]]; then
	echo "Resetting";

	# Clear the icon cache
	sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
	sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;

	# Now restart the Dock and Finder after these changes
	sudo killall Dock;
	sudo killall Finder;

    # Restart XtraFinder if you have it
    open /Applications/XtraFinder.app
fi

