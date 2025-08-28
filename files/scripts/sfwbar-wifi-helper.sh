#!/usr/bin/sh
case "$1" in
        signal)
                nmcli dev wifi list | awk '/\*/{if (NR!=1) {print $9}}'
                ;;
        *)
                echo ciao
                ;;
esac