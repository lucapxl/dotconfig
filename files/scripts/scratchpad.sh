#!/bin/bash

SCRATCHED=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].name' | sed ':a;N;$!ba;s/\n/\\n- /g')
COUNT=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.name == "__i3_scratch").floating_nodes[].app_id' | wc -l)

if [ $COUNT != 0 ]; then 
    echo '{"alt":'"$COUNT"',"tooltip":"'"- $SCRATCHED"'","class":"present"}'
fi
