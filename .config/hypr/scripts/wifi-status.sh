#!/bin/bash
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
[ -z "$ssid" ] && echo "󰤭" || echo " $ssid"
