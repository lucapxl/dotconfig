#!/usr/bin/env bash

case "$1" in
        connected)
                connected=$(nmcli -t dev status |grep "$2" | wc -l)
                echo "$connected"
                ;;
        stats)
                stats=$(nmcli -t connection show "$2")
                echo "$stats"
                ;;
        up)
                nmcli connection up "$2"
                ;;
        down)
                nmcli connection down "$2"
                ;;
        toggle)
                status=$(nmcli -t dev status |grep "$2" | wc -l)
                echo "$status"
                if [ $status -eq 1 ]; then
                        nmcli connection down "$2"
                else
                        nmcli connection up "$2"
                fi
                ;;
        *)
                echo "use 'connections' as argument"
                ;;
esac