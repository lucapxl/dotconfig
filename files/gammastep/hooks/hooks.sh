#!/bin/env bash
#echo `date` "$1 $2 $3" >> /tmp/gammastep.txt
case $1 in
    period-changed)
        case $3 in
          transition|daytime|none)
            notify-send -h string:x-canonical-private-synchronous:gammastep "Daytime" -i weather-clear-symbolic
            ;;
          night)
            notify-send -h string:x-canonical-private-synchronous:gammastep "Night Time" -i weather-clear-night-symbolic
            ;;
        esac
esac
