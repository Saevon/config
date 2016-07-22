#!/bin/bash

# Ask for the administrator password upfront
sudo -v


# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



##################################################
# General UI/UX
##################################################

# TODO: see systemsetup for a BSD/OSX preferences editor

# Menu bar: transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400




# Hide useless icons
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
# 	defaults write "${domain}" dontAutoLoad -array \
# 		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
# 		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
# 		"/System/Library/CoreServices/Menu Extras/User.menu"
# Listing only ones to keep
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/TextInput.menu" \


# Set highlight color to green
HIGH_RED=190
HIGH_GREEN=245
HIGH_BLUE=200

# HIGH_RED=195
# HIGH_GREEN=249
# HIGH_BLUE=145
defaults write NSGlobalDomain AppleHighlightColor -string "`echo $HIGH_RED / 255 | bc -l` `echo $HIGH_GREEN / 255 | bc -l` `echo $HIGH_BLUE / 255 | bc -l`"
# Uncomment to reset highlight color
defaults delete -g AppleHighlightColor

# Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`


# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true


# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false


# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# Check for software updates daily, not just once per week
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# Set the Login Background
sudo ./login_back.sh Backgrounds/Login-Background.jpg


##################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
##################################################
# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad map Double tap tp right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Trackpad: swipe between pages with three fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# enable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


# Enable access for assistive devices
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144


# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write com.sublimetext.2 ApplePressAndHoldEnabled -bool false
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 0



# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "ru" "ja" "fr"
defaults write NSGlobalDomain AppleLocale -string "en_CA@currency=CAD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Set the timezone; see `systemsetup -listtimezones` for other values
systemsetup -settimezone "America/Toronto" > /dev/null

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false



##################################################
# Screen
##################################################

# Require password short while after screensaver/sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 3600

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Don't Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool false

sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true





##################################################
# Finder
##################################################

# Disable quiting using ⌘ Q
defaults write com.apple.finder QuitMenuItem -bool false

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0



# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true


# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes




##################################################
# Dock
##################################################

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 60

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 1

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true





##################################################
# Hot Corners
##################################################
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 1048576
# Top right
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 1048576
# Bottom left
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 1048576
# Bottom right
defaults write com.apple.dock wvous-tl-corner -int 6
defaults write com.apple.dock wvous-tl-modifier -int 1048576




##################################################
# Spaces
##################################################

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true




##################################################
# iTunes
##################################################

# Disable the iTunes store link arrows
defaults write com.apple.iTunes show-store-link-arrows -bool false



##################################################
# Mail.app
##################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false





##################################################
# Terminal
##################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Themes
defaults write com.apple.terminal "Default Window Settings" -string "Pro"
defaults write com.apple.terminal "Startup Window Settings" -string "Pro"

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true



##################################################
# Time Machine
##################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal



##################################################
# Address Book
##################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true



##################################################
# TextEdit
##################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4





##################################################
# DiskUtility
##################################################

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true


##################################################
# Google Chrome
##################################################
# Allow installing user scripts via GitHub or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"




echo "Now change the following:"
echo "Terminal: enable 'Option as meta key'"








##################################################
# Restart any affected applications
##################################################

for app in "Address Book" \
	"Chrome" \
	"Calendar" \
	"Contacts" \
	"Dashboard" \
	"Dock" \
	"Finder" \
	"Mail" \
	"Safari" \
	"SystemUIServer" \
	"iCal" \
	"iTunes"; do
	killall "$app" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

echo "Suggest: Change the modifier key (CAPS)>>(CTRL)"
