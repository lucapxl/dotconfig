#!/bin/bash

# Make sure screenshot folder exists
mkdir -p ~/Pictures/Screenshots

application_name="Screenshot"
SSDIR=~/Pictures/Screenshots
SSNAME="$(date +%y%m%d_%H%M%S).png"

case "$1" in
        area)
                grim -g "$(slurp)" $SSDIR/$SSNAME
                ;;
        *)
                grim $SSDIR/$SSNAME
                ;;
esac

if [ $(pgrep -x -c dunst) -eq 0 ]; then
    dunst &
fi
notify-send -a $application_name "$SSNAME" -i "$SSDIR/$SSNAME" -t 1500 -u "low"