#!/bin/bash


# First parse in the inputs
# TODO:
icon="./icons/AirDrop.icns"
target="/Applications/Camera.app"
result="Alias"
location="."

# target=$1
# result=$2
# icon=$3
# location=$4 || "/Applications"


# Now we need to check any inputs
# TODO:



# Now do the actual work of creating the app
# TODO: catch any errors

mkdir ${location}/${result}.app
mkdir ${location}/${result}.app/Contents
mkdir ${location}/${result}.app/Contents/MacOS
mkdir ${location}/${result}.app/Contents/Resources

echo "#!bin/bash
open \"${target}\"
" > ${location}/${result}.app/Contents/MacOS/alias.sh
chmod +x ${location}/${result}.app/Contents/MacOS/alias.sh

cp ${icon} ${location}/${result}.app/Contents/Resources/icon.icns

echo "
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>alias.sh</string>
	<key>CFBundleIconFile</key>
	<string>icon.icns</string>
	<key>CFBundleName</key>
	<string>${result}</string>
</dict>
</plist>
" > ${location}/${result}.app/Contents/Info.plist
