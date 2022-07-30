#!/bin/bash

SSDIR=~/Pictures/Screenshots

area() {
    SSNAME=area_$(date +%y%m%d_%H%M%S).png
    grim -g "$(slurp)" $SSDIR/$SSNAME
    notify-send "Area screenshot taken" "$SSNAME" -i "$SSDIR/$SSNAME"

}

fullscreen () {
    SSNAME=full_$(date +%y%m%d_%H%M%S).png
    grim $SSDIR/$SSNAME
    notify-send "Full screenshot taken" "$SSNAME" -i "$SSDIR/$SSNAME" 
}

case "$1" in
        area)
                area
                ;;
        *)
                fullscreen
                ;;
esac
