#!/usr/bin/env sh

start_kanshi() {
    # Terminate already running bar instances
    pkill kanshi
    # Wait until the processes have been shut down
    while pgrep -x kanshi >/dev/null; do sleep 1; done
    
    # Make sure waybar is running before running kanshi
    while [ $(pgrep -x -c waybar) -eq 0 ]; do sleep 1; done
    kanshi &
}

notify() {
    if [ $(pgrep -x -c dunst) -eq 0 ]; then
        dunst &
    fi
    ICON="preferences-desktop-display"
    notify-send \
        --app-name kanshi \
        --expire-time 10000 \
        --hint string:x-canonical-private-synchronous:kanshi \
        --icon "$ICON" \
        --transient \
        "$1" "profile applied"
}

case "$1" in
        notify)
                notify "$2"
                ;;
        *)
                start_kanshi
                ;;
esac