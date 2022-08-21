#!/usr/bin/env sh

start_kanshi() {
    # Terminate already running bar instances
    pkill kanshi
    # Wait until the processes have been shut down
    while pgrep -x kanshi >/dev/null; do sleep 1; done
    # Start kanshi
    kanshi
}

notify() {
    ICON="video-display-symbolic"
    
    notify-send \
        --app-name kanshi \
        --expire-time 1500 \
        --hint string:x-canonical-private-synchronous:kanshi \
        --icon "$ICON" \
        --transient \
        "Kanshi profile" "$1"

}

case "$1" in
        notify)
                notify "$2"
                ;;
        *)
                start_kanshi
                ;;
esac