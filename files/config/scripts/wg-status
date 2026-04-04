#!/usr/bin/env bash
# ~/.config/scripts/wg-status.sh
# Outputs JSON for waybar custom module.
# If no WireGuard interface exists, outputs empty text → module is hidden.

WG_CONN=$(nmcli -g CONNECTION.INTERFACE-NAME connection show "$1")

if [[ -z "$WG_CONN" ]]; then
    # No interface at all — output empty, waybar hides the module
    echo '{"text": "", "tooltip": "", "class": "disconnected"}'
    exit 0
fi

STATUS=$(nmcli -g GENERAL.STATE connection show "$1")
if [[ -n "$STATUS" ]]; then
    IP=$(nmcli -g IP4.ADDRESS device show "$WG_CONN")
    echo "{\"text\": \"\", \"tooltip\": \"<b>VPN:</b> $WG_IF\\n<b>IP:</b> $IP\\nClick to disconnect\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"<b>VPN:</b> $WG_IF — no IP\\nClick to connect\", \"class\": \"disconnected\"}"
fi
