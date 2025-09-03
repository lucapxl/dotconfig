#!/usr/bin/sh
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
        *)
                echo "use 'connections' as argument"
                ;;
esac