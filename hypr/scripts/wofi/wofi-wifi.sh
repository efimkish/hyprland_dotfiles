#!/bin/bash

list=$(nmcli --fields "SSID,SECURITY,BARS" device wifi list | sed 1d | sed 's/  */ /g' | sed -n "/^--/!p" | uniq)

chosen=$(echo -e "$list" | wofi -d -p "Wi-Fi" -W 500 -H 400)

[ -z "$chosen" ] && exit 0

ssid=$(echo "$chosen" | awk '{$NF=""; $(NF-1)=""; print $0}' | xargs)
security=$(echo "$chosen" | awk '{print $(NF-1)}')

if [ -n "$security" ]; then
    password=$(wofi -d -p "Пароль для $ssid" -W 400 -H 100)
    [ -z "$password" ] && exit 0
    nmcli device wifi connect "$ssid" password "$password" || \
        notify-send -u critical "Wi-Fi" "Не удалось подключиться к $ssid"
else
    nmcli device wifi connect "$ssid" || \
        notify-send -u critical "Wi-Fi" "Не удалось подключиться к $ssid"
fi

notify-send -u low "Wi-Fi" "Подключено к $ssid"
