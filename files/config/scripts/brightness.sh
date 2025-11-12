#!/usr/bin/env bash

# Set the brightness level
brightnessctl set $1 > /dev/null

# Read the current brightness level
brightness=`brightnessctl g`
brightnessmax=`brightnessctl m`
brightnesspercent=$(( ( brightness * 100 ) / brightnessmax ))

# Send the notification
application_name="Brightness"
brightness_icon="preferences-desktop-brightness"
if [ $(pgrep -x -c dunst) -eq 0 ]; then
    dunst &
fi
notify-send -a $application_name -h string:x-canonical-private-synchronous:brightness "$brightnesspercent%" -h int:value:"$brightnesspercent" -t 1500 --icon $brightness_icon -u low
