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

if [ $(pgrep -x -c 1password) -eq 0 ]; then
    echo "running 1password"
    1password --silent &
fi

if [ $(pgrep -x -c nextcloud) -eq 0 ]; then
    echo "running nextcloud"
    nextcloud &
fi

gnome-keyring-daemon --start &