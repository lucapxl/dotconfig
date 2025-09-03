#!/usr/bin/sh
case "$1" in
        status)
                if [ "$(cat /sys/class/leds/input*\:\:scrolllock/brightness | head -n 1)" == "1" ]; then echo 'US';else echo 'CH'; fi
                ;;
        *)
                echo "use 'status' as argument"
                ;;
esac