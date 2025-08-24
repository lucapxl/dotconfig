#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
FILES_DIR=$SCRIPTPATH/files/

echo "applying dotconfig files"

rm -rf ~/.config/bg.jpg
rm -rf ~/.config/foot
rm -rf ~/.config/dunst
rm -rf ~/.config/fontconfig 
rm -rf ~/.config/gammastep 
rm -rf ~/.config/kanshi 
rm -rf ~/.config/scripts
rm -rf ~/.config/sway 
rm -rf ~/.config/swaylock 
rm -rf ~/.config/waybar
rm -rf ~/.config/wlogout
rm -rf ~/.config/rofi
rm -rf ~/.config/sfwbar
rm -rf ~/.config/labwc

cp -R $SCRIPTPATH/files/* ~/.config/
