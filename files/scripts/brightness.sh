#!/usr/bin/bash


brightness=`light`
brightness=${brightness%.*}
if [ $brightness -eq 0 ]; then
    notify-send -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon display-brightness-off-symbolic -u low
elif [ $brightness -le 30 ]; then
    notify-send -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon display-brightness-low-symbolic -u low
elif [ $brightness -le 70 ]; then
    notify-send -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon display-brightness-medium-symbolic -u low
else
    notify-send -h string:x-canonical-private-synchronous:brightness "$brightness%" -h int:value:"$brightness" -t 1500 --icon display-brightness-high-symbolic -u low
fi