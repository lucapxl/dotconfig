#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
FILES_DIR=$SCRIPTPATH/files/

echo $SCRIPTPATH
echo $FILES_DIR

rm -rf $SCRIPTPATH/files/*

mkdir -p $FILES_DIR
cp -R ~/.config/bg.jpg $FILES_DIR
cp -R ~/.config/foot $FILES_DIR
cp -R ~/.config/dunst $FILES_DIR
cp -R ~/.config/fontconfig $FILES_DIR
cp -R ~/.config/gammastep $FILES_DIR
cp -R ~/.config/scripts $FILES_DIR
cp -R ~/.config/sway $FILES_DIR
cp -R ~/.config/swaylock $FILES_DIR
cp -R ~/.config/waybar $FILES_DIR
cp -R ~/.config/wlogout $FILES_DIR
cp -R ~/.config/rofi $FILES_DIR
cp -R ~/.config/kanshi $FILES_DIR
