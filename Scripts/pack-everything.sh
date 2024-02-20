#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

greenMessage () { echo -e "${GREEN}${1}${NC}"; }
redMessage () { echo -e "${RED}${1}${NC}"; }

compressDirs () {
	DIR_PATH=("/Documents" "/Downloads" "/Music" "/Pictures" "/Public" "/Templates" "/Videos" "/Projects" "/Software")
	for i in ${DIR_PATH[@]}; do
		WORK_DIR=$USER_HOME$i/
		TARGET=$1$i.zip
		echo -e "\nCompressing directory:" $WORK_DIR
		zip -r $TARGET  $WORK_DIR
		if [ $? -eq 0 ]; then
			greenMessage "Zip file '${TARGET}' was created successfully."
		else
			redMessage "Error: Failed to create zip file!"
			exit 1
		fi
	done
}

networkConnections () {
	cp -vrp /etc/NetworkManager/system-connections/ $1
}

firefoxProfile () {
# /home/tymoteusz/snap/firefox/common/.mozilla/firefox/vdzx7rsu.default
# /home/tymoteusz/snap/firefox/common/.cache/mozilla/firefox/vdzx7rsu.default
	zip -r $USER_HOME/snap/firefox/common/ $1
}

desktopFiles () {
	TARGET=$1"/DesktopFiles"
	mkdir -p $TARGET
	chmod 777 $TARGET
	cp -vp /usr/share/applications/{mars,droidcam,Wallpaper-Change}.desktop $TARGET
}

extensions () {
	cp -vrp $USER_HOME/.local/share/gnome-shell/extensions/ $1
}

echo "Starting backup..."

# Check if given backup directory
if [ $# -eq 1 ]; then
	mkdir -p $1
	chmod 777 $1
else 
	redMessage "Error: Target directory not given!"
	exit
fi

# Check if run as root
if [ "$EUID" -ne 0 ]; then
	redMessage "Error: Not executed as a root"
	exit
fi

echo -e "Compressing directories...\n"
compressDirs $1

echo -e "Getting all network connections...\n"
networkConnections $1 

echo -e "Copying Firefox profile data...\n"
firefoxProfile $1

echo -e "Copying .desktop files...\n"
desktopFiles $1

echo -e "Copying extensions...\n"
extensions $1

echo -e "\nBackup complete!"
