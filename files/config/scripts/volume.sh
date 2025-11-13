#!/usr/bin/env bash

if ! command -v notify-send >/dev/null || ! command -v pactl > /dev/null; then
    exit 0;
fi

# pactl output depends on the current locale
export LANG=C.UTF-8 LC_ALL=C.UTF-8
DEFAULT_STEP=5
LIMIT=${LIMIT:-100}
SINK="@DEFAULT_SINK@"

# checking if the current sink is muted
case $(pactl get-sink-mute "$SINK") in
    *yes)
        TEXT="Muted"
        ICON="audio-volume-muted"
        VOLUME=0
        ;;
esac

clamp() {
    if [ "$1" -lt 0 ]; then
        echo "0"
    elif [ "$1" -gt "$LIMIT" ]; then
        echo "$LIMIT"
    else
        echo "$1"
    fi
}

get_sink_volume() { # sink
    ret=$(pactl get-sink-volume "$1")
    # get first percent value
    ret=${ret%%%*}
    ret=${ret##* }
    echo "$ret"
    unset ret
}

CHANGE=0
VOLUME=-1

while true; do
    case $1 in
        --sink)
            SINK=${2:-$SINK}
            shift;;
        -l|--limit)
            LIMIT=$((${2:-$LIMIT}))
            shift;;
        --set-volume)
            VOLUME=$(($2))
            shift;;
        -i|--increase)
            CHANGE=$((${2:-$DEFAULT_STEP}))
            
            # if the sink is currently muted, unmute it too
            if pactl get-sink-mute "@DEFAULT_SINK@" | grep -q "yes"; then TOGGLEMUTE=1; fi
            shift;;
        -d|--decrease)
            CHANGE=$((-${2:-$DEFAULT_STEP}))
            shift;;
        --toggle-mute)
            TOGGLEMUTE=1
            shift;;
        *)
            break
            ;;
    esac
    shift
done

if [ "$CHANGE" -ne 0 ]; then
    VOLUME=$(get_sink_volume "$SINK")
    VOLUME=$(( VOLUME + CHANGE ))
    pactl set-sink-volume "$SINK" "$(clamp "$VOLUME")%"
elif [ "$VOLUME" -ge 0 ]; then
    pactl set-sink-volume "$SINK" "$(clamp "$VOLUME")%"
fi

if [ "$TOGGLEMUTE" -eq 1 ]; then
    pactl set-sink-mute "$SINK" toggle
fi

# Display desktop notification
if ! command -v notify-send >/dev/null; then
    exit 0;
fi

VOLUME=$(get_sink_volume "$SINK")
TEXT="${VOLUME}%"
ICON="audio-volume-high"
if [ $VOLUME -eq 0 ]; then
    ICON="audio-volume-muted"
elif [ $VOLUME -le 25 ]; then
    ICON="audio-volume-low"
elif [ $VOLUME -le 66 ]; then
    ICON="audio-volume-medium"
fi

# if the sink is muted
if pactl get-sink-mute "@DEFAULT_SINK@" | grep -q "yes"; then
    TEXT="Muted"
    ICON="audio-volume-muted"
    VOLUME=0
fi

if [ $(pgrep -x -c dunst) -eq 0 ]; then
    dunst &
fi
notify-send \
    --app-name Volume \
    --expire-time 1500 \
    --hint string:x-canonical-private-synchronous:volume \
    --hint "int:value:$VOLUME" \
    --icon "$ICON" \
    --transient \
    "${TEXT}"
