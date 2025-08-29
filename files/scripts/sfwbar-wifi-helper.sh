#!/usr/bin/sh
case "$1" in
        signal)
                signal=$(nmcli -t -f IN-USE,SSID,CHAN,RATE,SIGNAL,DEVICE dev wifi list  |grep "*")
                echo "${signal:2}"
                ;;
        *)
                echo ciao
                ;;
esac