#!/bin/bash

networks=$(nmcli -t -f in-use,ssid,signal dev wifi | sed 's/^*/ /')
choice=$(echo "$networks" | rofi -dmenu -theme ~/.config/rofi/themes/endeavour-rounded.rasi)

ssid=$(echo "$choice" | sed 's/ //')

[ -n "$ssid" ] && nmcli dev wifi connect "$ssid"
