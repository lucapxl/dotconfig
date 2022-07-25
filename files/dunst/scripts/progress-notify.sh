#!/usr/bin/env sh

# progress-notify - Send audio and brightness notifications for dunst

# dependencies: dunstify, pactl, Papirus (icons)

### How to use: ###
# Pass the values via stdin and provide the notification type
# as an argument. Options are audio, brightness and muted

### Audio notifications ###
#   ponymix increase 5 | notify audio
#   ponymix decrease 5 | notify audio
#   pulsemixer --toggle-mute --get-mute | notify muted
### Brightness notifications ###
#   xbacklight -inc 5  && xbacklight -get | notify brightness
#   xbacklight -dec 5  && xbacklight -get | notify brightness

notifyMuted() {
        volume="$1"
        dunstify -h string:x-canonical-private-synchronous:audio -a Volume "Muted" -h int:value:"$volume" -t 1500 --icon audio-volume-muted
}

notifyAudio() {
        volume="$1"
        pactl get-sink-mute 0 |grep -q yes && notifyMuted "Volume: $volume%" && return

        if [ $volume -eq 0 ]; then
                notifyMuted "$volume"
        elif [ $volume -le 30 ]; then
                dunstify -h string:x-canonical-private-synchronous:audio -a Volume "Volume: $volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-low
        elif [ $volume -le 70 ]; then
                dunstify -h string:x-canonical-private-synchronous:audio -a Volume "Volume: $volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-medium
        else
                dunstify -h string:x-canonical-private-synchronous:audio -a Volume "V0lume $volume%" -h int:value:"$volume" -t 1500 --icon audio-volume-high
        fi
}

notifyBrightness() {
        brightness="$1"
        if [ $brightness -eq 0 ]; then
                dunstify -h string:x-canonical-private-synchronous:brightness -a Brightness "$brightness" -h int:value:"$brightness" -t 1500 --icon display-brightness-off-symbolic
        elif [ $brightness -le 30 ]; then
                dunstify -h string:x-canonical-private-synchronous:brightness -a Brightness "$brightness" -h int:value:"$brightness" -t 1500 --icon display-brightness-low-symbolic
        elif [ $brightness -le 70 ]; then
                dunstify -h string:x-canonical-private-synchronous:brightness -a Brightness "$brightness" -h int:value:"$brightness" -t 1500 --icon display-brightness-medium-symbolic
        else
                dunstify -h string:x-canonical-private-synchronous:brightness -a Brightness "$brightness" -h int:value:"$brightness" -t 1500 --icon display-brightness-high-symbolic
        fi
}

input=`cat /dev/stdin`

case "$1" in
        audio)
                volume=`pactl get-sink-volume 0 | awk '{print substr($5, 1, length($5)-1)}'`
                notifyAudio "$volume"
                ;;
        brightness)
                # convert float to int
                brightness=`light`
                brightness=${brightness%.*}
                notifyBrightness "$brightness"
                ;;

        *)
                echo "Not the right arguments"
                echo "$1"
                exit 2
esac
