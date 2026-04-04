#!/usr/bin/env bash
# ~/.config/scripts/taskbar-toggle.sh
# Manages the bottom waybar instance (taskbar).

WAYBAR_CONFIG="$HOME/.config/waybar/config-bottom"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

is_running() {
    pgrep -f "waybar.*config-bottom" > /dev/null 2>&1
}

case "$1" in
    toggle)
        if is_running; then
                pkill -f "waybar.*config-bottom"
        else
            waybar -c "$WAYBAR_CONFIG" -s "$WAYBAR_STYLE" &
        fi
        ;;
    status)
        if is_running; then
            echo '{"tooltip": "Taskbar: ON — click to hide", "class": "active"}'
        else
            echo '{"tooltip": "Taskbar: OFF — click to show", "class": "inactive"}'
        fi
        ;;
    *)
        echo "Usage: $0 {toggle|status}"
        exit 1
        ;;
esac
