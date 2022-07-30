#!/bin/bash
COUNT=$(ivpn status | grep -c " CONNECTED")


connect() {
    if [ $COUNT != 1 ]; then 
        notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "Connecting..." -t 5000 --icon security-high-symbolic -u low
        if ivpn connect -any -c Netherland; then
            notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "Connected" -t 5000 --icon view-private-symbolic -u low
        else
            notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "ERROR" -t 5000 --icon dialog-error-symbolic -u low
        fi
    fi
}

disconnect() {
    if [ $COUNT != 0 ]; then 
        notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "Disconnecting" -t 5000 --icon security-high-symbolic -u low
        if ivpn disconnect; then
            notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "Disconnected" -t 5000 --icon dialog-information-symbolic -u low
        else
            notify-send -h string:x-canonical-private-synchronous:ivpn IVPN "ERROR" -t 5000 --icon dialog-error-symbolic -u low
        fi
    fi
}

status () {
    CONNECTED=
    DISCONNECTED=
    TOOLTIP=$(ivpn status | sed ':a;N;$!ba;s/\n/\\n/g')

    if [ $COUNT != 0 ]; then 
        echo '{"alt":"connected","tooltip":"'"$TOOLTIP"'","class":"connected"}'
    else 
        echo '{"alt":"disconnected","tooltip": "'"$TOOLTIP"'","class":"disconnected"}'
        #echo "{\"alt\":\"disconnected\",\"tooltip\":\"$TOOLTIP\",\"class\":\"disconnected\"}"
    fi
}

case "$1" in
        connect)
                connect
                ;;
        disconnect)
                disconnect
                ;;
        *)
                status
                ;;
esac


# to connect - ivpn connect -any -c Netherland
# to disconnect - ivpn disconnect
# output exptected {"text": "$text", "alt": "$alt", "tooltip": "$tooltip", "class": "$class", "percentage": $percentage }