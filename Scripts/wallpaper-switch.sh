#!/bin/bash

# Old parts of code that are  not longer necessary
# export $(dbus-launch)
# export DISPLAY=:1

PID=$(pgrep -t tty2 gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ | cut -d= -f2- | tr '\0' '\n' )

WALLPAPER_PATH="/home/tymoteusz/Pictures/Wallpaper/InUse/"

change_wallpaper () {
    number_of_files=$(ls $WALLPAPER_PATH | grep "wallpaper-${DAYTIME}-.*\.jpg" | wc -l)
    echo "Number of detected wallpapers for ${DAYTIME}: ${number_of_files}" 

    wallpaper_filename="wallpaper-${DAYTIME}-$(($RANDOM % $number_of_files)).jpg"
    echo "Wallpaper filename is: ${wallpaper_filename}"

    gsettings set org.gnome.desktop.background picture-uri "file://${WALLPAPER_PATH}${wallpaper_filename}"
}

HOUR=$(date +%-H)
(( HOUR >= 6 && HOUR < 21 )) && DAYTIME="day" || DAYTIME="night"
echo "Now is: ${DAYTIME}"
change_wallpaper
CURRENT_WALLPAPER=$(gsettings get org.gnome.desktop.background picture-uri | grep 'day')
if ([ -z "$CURRENT_WALLPAPER" ] && [ "$DAYTIME" == "day" ]) || ([ ! -z "$CURRENT_WALLPAPER" ] && [ "$DAYTIME" == "night" ]); then
    change_wallpaper
fi

# this code is also saved in /etc/profile.d/
# remember that when applying changes
# cp ~/Software/Scripts/wallpaper-switch.sh /etc/profile.d/
