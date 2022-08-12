#!/usr/bin/env bash

# Terminate already running bar instances
pkill -9 waybar
sleep 3
# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

    export XDG_CURRENT_DESKTOP=Unity
    # Launch main
    waybar
do sleep
