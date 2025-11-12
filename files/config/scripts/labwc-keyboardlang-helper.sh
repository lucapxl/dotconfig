#!/usr/bin/env bash

case "$1" in
        status)
                IFS=','
                read -a keyboard_values <<< "$XKB_DEFAULT_LAYOUT"
                brightnessFileName=$(ls /sys/class/leds/input*\:\:scrolllock/brightness | head -n 1)
                echo "${keyboard_values[$(cat $brightnessFileName)]}"
                ;;
        *)
                echo "use 'status' as argument"
                ;;
esac