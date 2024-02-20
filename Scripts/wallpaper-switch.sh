#!/bin/bash

#export $(dbus-launch)
#export DISPLAY=:1

PID=$(pgrep -t tty2 gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ | cut -d= -f2- | tr '\0' '\n' )

day_wallpaper="/home/tymoteusz/Pictures/Wallpaper/wallpaper-day.jpg"
night_wallpaper="/home/tymoteusz/Pictures/Wallpaper/wallpaper-night.png"


hour=$(date +%H)
if (( hour >= 6 && hour < 21 )); then
    gsettings set org.gnome.desktop.background picture-uri $day_wallpaper
else
    gsettings set org.gnome.desktop.background picture-uri $night_wallpaper
fi

# this code is also saved in /etc/profile.d/
# remember that when applying changes
# cp ~/Software/Scripts/wallpaper-switch.sh /etc/profile.d/
