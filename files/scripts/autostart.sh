#!/usr/bin/bash

# Make sure waybar is running
while [ $(pgrep -x -c waybar) -eq 0 ]; do sleep 1; done

$HOME/.config/scripts/kanshi.sh &

if [ $(pgrep -x -c nm-applet) -eq 0 ]; then
    echo "running nm-applet"
    nm-applet --indicator &
fi

if [ $(pgrep -x -c gammastep) -eq 0 ]; then
    echo "running gammastep"
    gammastep &
fi

if [ $(pgrep -x -c lxpolkit) -eq 0 ]; then
    echo "running lxpolkit"
    lxpolkit &
fi

if [ $(pgrep -x -c firefox) -eq 0 ]; then
    echo "running firefox"
    firefox &
fi

if [ $(pgrep -x -c nextcloud) -eq 0 ]; then
    echo "running nextcloud"
    nextcloud &
fi

if [ $(pgrep -x -c keepassxc) -eq 0 ]; then
    echo "running KeePass XC"
    flatpak run org.keepassxc.KeePassXC &
fi

#gnome-keyring-daemon --start &
