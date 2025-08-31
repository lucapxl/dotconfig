#!/usr/bin/sh


case "$1" in
        main-battery)
                upower -i $(upower -e | grep 'BAT')
                ;;
        other-batteries)
                for dev in $(upower -e); do
                        model=$(upower -i "$dev" | awk -F: '/model/ {gsub(/^[ \t]+/, "", $2); print $2}')
                        percentage=$(upower -i "$dev" | awk -F: '/percentage/ {gsub(/^[ \t]+/, "", $2); print $2}')

                        if [[ -n "$model" && -n "$percentage" ]]; then
                                echo "${model}: ${percentage} \n"
                        fi
                done
                ;;
        *)
                echo "use 'main-battery' as argument"
                ;;
esac