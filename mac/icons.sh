#!/usr/bin/env bash

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

	if [ ! -d  "$REQUIRE" ]; then
		1>&2 echo "WARN: $PROG_NAME App Not Found ($REQUIRE)"
		return 1;
	fi

	if [ ! -f "$ICON" ]; then
		1>&2 echo "ERROR: $PROG_NAME Icon Not Found ($ICON)."
		return 2;
	fi

	# Create the backup directory
	sudo mkdir -p "$BAK"
	if [ $? != 0 ]; then
		1>&2 echo "ERROR: Failed to mkdir"
		return 1;
	fi

	if [ -f "${BAK_ICON}" ]; then
		OLDSHA=$(sha256sum "${BAK_ICON}" | awk '{print $1}')
		NEWSHA=$(sha256sum "${ICON}" | awk '{print $1}')

		if [ "${NEWSHA}" == "${OLDSHA}" ]; then
			# already backed up!
			return 0;
		fi

		EXT=${BAK_ICON##*.}

		# Move the old backup away
		sudo mv "${BAK_ICON}" "${BAK_ICON%.*}.$(openssl rand -hex 12).${EXT}"
		if [ $? != 0 ]; then
			1>&2 echo "ERROR: Failed to backup icon"
			return 1;
		fi
	fi

	# Backup the old icon in case we need it
	sudo mv "$ICON" "$BAK_ICON"
	if [ $? != 0 ]; then
		1>&2 echo "ERROR: Failed to backup icon"
		return 1;
	fi
}


function rpl_icon {
	REQUIRE=$1
	ORIG_ICON=$2
	NEW_ICON=$3
	PROG_NAME=$4

	backup "$REQUIRE" "$ORIG_ICON" "$NAME"
	if [[ $? != 0 ]]; then
		return 1;
	fi

	sudo cp "$NEW_ICON" "$ORIG_ICON"
}


function rpl_app {
	echo "Working: " $NAME
	rpl_icon "$REQ" "$REQ/Contents/Resources/$ICON" "./icons/$NEW" "$NAME"
}
function backup_app {
	backup "$REQ" "$REQ/Contents/Resources/$ICON" "$NAME"
}



###################################################
# Documents and Images

# ePub
REQ="/Applications/Readers/Kitabu.app"
ICON="Kitabu.icns"
NEW="Documents/ePub.icns"
NAME="ePub <Kitabu>"
rpl_app

# Generic MAC
REQ="/System/Applications/Preview.app"
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



###################################################




###########A########################################
# Music

# iTunes
# REQ="/Applications/iTunes.app"
# NAME="iTunes"
# ICON="iTunes.icns"
# NEW="Music/iTunes.icns"
# rpl_app

# Misc Files
REQ="/System/Applications/Music.app"
NAME="Music"

# ICON="Music-generic.icns"
# NEW="Music/generic.icns"
# rpl_app

ICON="Music-mp3.icns"
NEW="Music/generic.icns"
rpl_app
ICON="Music-mpeg4.icns"
NEW="Music/generic.icns"
rpl_app

ICON="Music-mpg.icns"
NEW="Music/generic.icns"
rpl_app

ICON="Music-aiff.icns"
NEW="Music/generic.icns"
rpl_app

# ICON="Music-ogg.icns"
# NEW="Music/generic.icns"
# rpl_app

ICON="Music-wav.icns"
NEW="Music/generic.icns"
rpl_app

# ICON="Music-wma.icns"
# NEW="Music/generic.icns"
# rpl_app
###################################################




###################################################
# Misc Apps

# Calculator
# REQ="/Applications/Calculator.app"
# ICON="calculator.icns"
# NEW="Calculator.icns"
# NAME="Calculator"
# rpl_app

# Chrome
# REQ="/Applications/Google Chrome.app"
# ICON="app.icns"
# NEW="Chrome Sleek.icns"
# NAME="Chrome"
# rpl_app

# Gimp
REQ="/Applications/Gimp.app"
ICON="gimp.icns"
NEW="Gimp.icns"
NAME="Gimp"
rpl_app

NAME="GIMP ext"
ICON="xcf.icns"
NEW="xcf.icns"
rpl_app

# Icon Creation
REQ="/Applications/Tools/Image2Icon.app"
ICON="AppIcon.icns"
NEW="img2icns.icns"
NAME="Image2Icon"
rpl_app

# Audacity
REQ="/Applications/Audacity.app"
NEW="Audacity.icns"
ICON="Audacity.icns"
NAME="Audacity"
rpl_app

NAME="Audacity Project"
ICON="AudacityProject.icns"
NEW="Audacity Project.icns"
rpl_app


# Firefox
REQ="/Applications/Firefox.app"
ICON="firefox.icns"
NEW="Firefox.icns"
NAME="FireFox"
rpl_app

# GitX
# REQ="/Applications/GitX.app"
# ICON="gitx.icns"
# NEW="GitX.icns"
# NAME="GitX"
# rpl_app


# Torrent
REQ="/Applications/qbittorrent.app"
ICON="qBitTorrentDocument.icns"
NEW="Torrent.icns"
NAME="Torrent-Files"
rpl_app



# -----------------------------------------------------------------------
# Mac Misc Apps
# Console Logger
# REQ="/Applications/Utilities/Console.app"
# ICON="AppIcon.icns"
# NEW="Console Logs.icns"
# NAME="Console"
# rpl_app

# Terminal
REQ="/System/Applications/Utilities/Terminal.app"
ICON="Terminal.icns"
NEW="shell2.icns"
NAME="Terminal"
rpl_app

# Preferences
# REQ="/Applications/System Preferences.app"
# ICON="PrefApp.icns"
# NEW="Settings.icns"
# NAME="System Preferences"
# rpl_app

# Finder
# REQ="/System/Library/CoreServices/Finder.app"
# ICON="Finder.icns"
# NEW="Finder.icns"
# NAME="Finder"
# rpl_app

# REQ="/System/Library/CoreServices/Dock.app"
# NEW="Finder.png"
# ICON="finder.png"
# rpl_app
# ICON="finder@2x.png"
# rpl_app

# Trash Icons
REQ="/System/Library/CoreServices/Dock.app"
NAME="Trash"


NEW="./Trash Set/Trash ~ Full.png"
ICON="trashfull.png"
rpl_app
ICON="trashfull@2x.png"
rpl_app

NEW="./Trash Set/Trash ~ Empty.png"
ICON="trashempty.png"
rpl_app
ICON="trashempty@2x.png"
rpl_app



##################
# Finder Icons
REQ="/System/Library/CoreServices/CoreTypes.bundle"
NAME="Finder"


# Misc
NEW="./Help.icns"
ICON="HelpIcon.icns"
rpl_app

NEW="./Apple.icns"
ICON="HomeFolderIcon.icns"
rpl_app
# NEW="./System/AirDrop.icns"
# ICON="AirDrop.icns"
# rpl_app
NEW="./System/Burning Disk.icns"
ICON="BurningIcon.icns"
rpl_app
NEW="./User/Downloads.icns"
ICON="DownloadsFolder.icns"
rpl_app
# ICON="SidebarDownloadsFolder.icns"
# rpl_app
NEW="./Documents/PDF.icns"
ICON="DocumentsFolderIcon.icns"
rpl_app
# ICON="SidebarDocumentsFolder.icns"
# rpl_app
# NEW="./User/Movies.icns"
# ICON="SidebarMoviesFolder.icns"
# rpl_app
# NEW="./User/Pictures.icns"
# ICON="SidebarPicturesFolder.icns"
# rpl_app
# NEW="./System/Applications.icns"
# ICON="SidebarApplicationsFolder.icns"
# rpl_app
# NEW="./User/Music.icns"
# ICON="SidebarMusicFolder.icns"
# rpl_app
# NEW="./User/Desktop.icns"
# ICON="SidebarDesktopFolder.icns"
# rpl_app
# NEW="./User/Projects.icns"
# ICON="SidebarGenericFolder.icns"  # Technically this relies on me only adding ONE folder to the sidebar
# rpl_app


# Trash folder icons (When Open)
NEW="./Trash Set/Trash ~ Full.icns"
ICON="FullTrashIcon.icns"
rpl_app
NEW="./Trash Set/Trash ~ Empty.icns"
ICON="TrashIcon.icns"

# Drives (Sidebar)
# NEW="./HardDrives/airport.icns"
# ICON="SidebarAirportDisk.icns"
# rpl_app
# NEW="./HardDrives/usb.icns"
# ICON="SidebarExternalDisk.icns"
# rpl_app

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


# Games which all use the same icon format
ALL_GAMES=()
ALL_GAMES+=('Bastion')
ALL_GAMES+=('VVVVVV')
ALL_GAMES+=('Transistor')
ALL_GAMES+=('Plague Inc Evolved')
ALL_GAMES+=('Mark of the Ninja')
ALL_GAMES+=('Evoland 2')

for ((index = 0; index < ${#ALL_GAMES[@]}; index++)); do
	game=${ALL_GAMES[index]}

	REQ="$HOME/Applications/Steam/$game.app"
	NEW="Games/$game.icns"
	ICON="shortcut.icns"
	NAME="Steam Game: $game"
	rpl_app
done

NAME="Steam Game: Slime"
REQ="$HOME/Applications/Steam/Slime Rancher.app"
NEW="Games/Slime Rancher ~ Tabby.icns"
ICON="shortcut.icns"
rpl_app


#######################
# User Folders
####################
# NOT WORKING python lib is deprectated
# replace_icon ~/Desktop ./icons/User/Desktop.icns
# replace_icon ~/Downloads ./icons/User/Downloads.icns
# replace_icon ~/Movies ./icons/User/Movies.icns
# replace_icon ~/Music ./icons/User/Music.icns
# replace_icon ~/Pictures ./icons/User/Pictures.icns
# replace_icon ~/Projects ./icons/User/Projects.icns
# replace_icon ~/Applications ./icons/System/Applications.icns
# replace_icon ~/Documents ./icons/Documents/PDF.icns





# Ask whether to restart
read -p "Should we reset? [y/n]: " reset

if [[ "$reset" == "y" ]]; then
	echo "Resetting";

	# Clear the icon cache
    # Mavericks
	sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
	sudo find /private/var/folders/ -name com.apple.iconservices -exec rm -rf {} \;
    sudo rm -rf /Library/Caches/com.apple.iconservices.store;

	# Now restart the Dock and Finder after these changes
	sudo killall Dock;
	sudo killall Finder;

    # Restart XtraFinder if you have it
    # open /Applications/XtraFinder.app
    true;
fi

