#!/bin/bash
active_window_id=$(printf 0x%x "$(xdotool getactivewindow)")
window_state=$(xprop -id "$active_window_id" | grep "_NET_WM_STATE(ATOM)")

if [[ "$window_state" == *"MAXIMIZED"* ]]; then
    wmctrl -ir "$active_window_id" -b remove,maximized_vert,maximized_horz
else
    xdotool windowminimize "$active_window_id"
fi
