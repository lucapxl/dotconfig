#!/usr/bin/sh
case "$1" in
        status)
                if [ "$(cat /sys/class/leds/input4\:\:scrolllock/brightness)" == "1" ]; then echo 'US';else echo 'CH'; fi
                ;;
        *)
                echo "use 'status' as argument"
                ;;
esac