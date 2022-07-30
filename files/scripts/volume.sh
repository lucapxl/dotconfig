#!/usr/bin/bash

# icons /usr/share/icons/Papirus/24x24/actions/
volume=`pactl get-sink-volume 0 | awk '{print substr($5, 1, length($5)-1)}'`
pactl get-sink-mute 0 |grep -q yes && volume=0

if [ $volume -eq 0 ]; then
    notify-send -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$volume" -t 1500 --icon audio-volume-muted-symbolic -u low
elif [ $volume -le 30 ]; then
    notify-send -h string:x-canonical-private-synchronous:audio "$volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-low-symbolic -u low
elif [ $volume -le 70 ]; then
    notify-send -h string:x-canonical-private-synchronous:audio "$volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-medium-symbolic -u low
else
    notify-send -h string:x-canonical-private-synchronous:audio "$volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-high-symbolic -u low
fi