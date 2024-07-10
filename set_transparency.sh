#!/bin/bash

# Get the active window ID
active_win_id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')

# Prompt the user for a transparency value (0-100)
transparency=$(zenity --scale --text="Set transparency percentage" --min-value=0 --max-value=100 --value=85 --step=1)

# Set transparency for the active window
xprop -id $active_win_id -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $(printf 0x%x $((0xffffffff * transparency / 100)))

