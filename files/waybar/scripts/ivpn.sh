#!/bin/bash

COUNT=$(ivpn status | grep -c " CONNECTED")
CONNECTED=
DISCONNECTED=
if [ $COUNT != 0 ]; then 
    echo '{"alt":"connected","tooltip": "to disconnect: ivpn disconnect","class":"connected"}'
else 
    echo '{"alt":"disconnected","tooltip": "to connect: ivpn connect -any -c Netherland","class":"disconnected"}'
fi

# to connect - ivpn connect -any -c Netherland
# to disconnect - ivpn disconnect
# output exptected {"text": "$text", "alt": "$alt", "tooltip": "$tooltip", "class": "$class", "percentage": $percentage }