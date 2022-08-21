#!/bin/sh

if ! command -v notify-send >/dev/null || ! command -v pactl > /dev/null; then
    exit 0;
fi

export LANG=C.UTF-8 LC_ALL=C.UTF-8

SINK=${1:-@DEFAULT_SINK@}
VOLUME=$(pactl get-sink-volume "$SINK")
# get first percent value
VOLUME=${VOLUME%%%*}
VOLUME=${VOLUME##* }
TEXT="${VOLUME}%"
ICON="audio-volume-muted-symbolic"

case $(pactl get-sink-mute "$SINK") in
    *yes)
        TEXT="Muted"
        VOLUME=0
        ;;
esac

if [ $VOLUME -eq 0 ]; then
    ICON="audio-volume-muted-symbolic"
elif [ $VOLUME -le 30 ]; then
    ICON="audio-volume-low-symbolic"
elif [ $VOLUME -le 70 ]; then
    ICON="audio-volume-medium-symbolic"
else
    ICON="audio-volume-high-symbolic"
fi

notify-send \
    --app-name sway \
    --expire-time 1500 \
    --hint string:x-canonical-private-synchronous:volume \
    --hint "int:value:$VOLUME" \
    --icon "$ICON" \
    --transient \
    "${TEXT}"
