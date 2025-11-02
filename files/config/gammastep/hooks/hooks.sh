#!/bin/env bash
#echo `date` "$1 $2 $3" >> /tmp/gammastep.txt
if [ $(pgrep -x -c dunst) -eq 0 ]; then
    dunst &
fi
case $1 in
    period-changed)
        case $3 in
          transition|daytime|none)
            notify-send -a "gammastep" -h string:x-canonical-private-synchronous:gammastep "Daytime" -i "weather-clear" -t 10000
            ;;
          night)
            notify-send -a "gammastep" -h string:x-canonical-private-synchronous:gammastep "Night Time" -i "weather-clear-night" -t 10000
            ;;
        esac
esac
