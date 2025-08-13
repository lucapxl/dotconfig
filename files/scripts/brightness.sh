#!/usr/bin/bash

# Set the brightness level
brightnessctl set $1

# Read the current brightness level
brightness=`brightnessctl g -P`

# Send the notification
application_name="Brightness"
brightness_icon="display-brightness-high-symbolic"
if [ $brightness -eq 0 ]; then
    brightness_icon="display-brightness-off-symbolic"
elif [ $brightness -le 30 ]; then
    brightness_icon="display-brightness-low-symbolic"
elif [ $brightness -le 70 ]; then
    brightness_icon="display-brightness-medium-symbolic"
fi

notify-send -a $application_name -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon $brightness_icon -u low
