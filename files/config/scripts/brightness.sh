#!/usr/bin/bash

# Set the brightness level
brightnessctl set $1

# Read the current brightness level
brightness=`brightnessctl g -P`

# Send the notification
application_name="Brightness"
brightness_icon="preferences-desktop-brightness"
# if [ $brightness -eq 0 ]; then
#     brightness_icon="brightness-low"
# elif [ $brightness -le 30 ]; then
#     brightness_icon="brightness-low"
# elif [ $brightness -le 60 ]; then
#     brightness_icon="brightness-low"
# fi

if [ $(pgrep -x -c dunst) -eq 0 ]; then
    dunst &
fi
notify-send -a $application_name -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon $brightness_icon -u low
