#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
FILES_DIR=$SCRIPTPATH/files/
FILES_DIR_CONFIG=$FILES_DIR/config
FILES_DIR_THEMES=$FILES_DIR/themes

echo $SCRIPTPATH
echo $FILES_DIR

rm -rf $SCRIPTPATH/files/*

mkdir -p $FILES_DIR
mkdir -p $FILES_DIR_CONFIG
mkdir -p $FILES_DIR_THEMES

cp -R ~/.config/bg.jpg $FILES_DIR_CONFIG
cp -R ~/.config/kitty $FILES_DIR_CONFIG
cp -R ~/.config/alacritty $FILES_DIR_CONFIG
cp -R ~/.config/foot $FILES_DIR_CONFIG
cp -R ~/.config/nvim $FILES_DIR_CONFIG
cp -R ~/.config/dunst $FILES_DIR_CONFIG
cp -R ~/.config/gammastep $FILES_DIR_CONFIG
cp -R ~/.config/scripts $FILES_DIR_CONFIG
cp -R ~/.config/swaylock $FILES_DIR_CONFIG
cp -R ~/.config/wlogout $FILES_DIR_CONFIG
cp -R ~/.config/kanshi $FILES_DIR_CONFIG
cp -R ~/.config/waybar $FILES_DIR_CONFIG
cp -R ~/.config/labwc $FILES_DIR_CONFIG
cp -R ~/.config/fuzzel $FILES_DIR_CONFIG
cp -R ~/.config/xdg-desktop-portal $FILES_DIR_CONFIG
cp -R ~/.themes/* $FILES_DIR_THEMES
