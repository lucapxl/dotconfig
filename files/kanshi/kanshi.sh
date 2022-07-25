#!/usr/bin/env sh

# Terminate already running bar instances
pkill -9 kanshi

# Wait until the processes have been shut down
while pgrep -x kanshi >/dev/null; do sleep 1; done

# Launch main
kanshi
do sleep