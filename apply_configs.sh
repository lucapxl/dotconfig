#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
FILES_DIR=$SCRIPTPATH/files/

echo "applying dotconfig files"

mkdir -p ~/.themes

rm -rf ~/.config/bg.jpg
rm -rf ~/.config/kitty
rm -rf ~/.config/dunst
rm -rf ~/.config/fontconfig
rm -rf ~/.config/gammastep
rm -rf ~/.config/kanshi
rm -rf ~/.config/scripts
rm -rf ~/.config/swaylock
rm -rf ~/.config/wlogout
rm -rf ~/.config/waybar
rm -rf ~/.config/labwc
rm -rf ~/.config/fuzzel
rm -rf ~/.config/nvim
rm -rf ~/.config/xdg-desktop-portal
rm -rf ~/.themes/*

cp -R $SCRIPTPATH/files/config/* ~/.config/
cp -R $SCRIPTPATH/files/themes/* ~/.themes/
