#!/usr/bin/env bash

case "$1" in
        signal)
                signal=$(nmcli -t -f IN-USE,SSID,CHAN,RATE,SIGNAL,DEVICE dev wifi list  |grep "*")
                echo "${signal:2}"
                ;;
        *)
                echo "use 'signal' as argument"
                ;;
esac