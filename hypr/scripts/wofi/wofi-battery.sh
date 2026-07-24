#!/bin/bash

PROFILE_FILE="/sys/firmware/acpi/platform_profile"
CHOICES_FILE="/sys/firmware/acpi/platform_profile_choices"

CURRENT=$(cat "$PROFILE_FILE" 2>/dev/null || echo "balanced")
AVAILABLE=$(cat "$CHOICES_FILE" 2>/dev/null || echo "low-power balanced performance")

BAT_CAP=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo "?")
BAT_STATUS=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null || echo "")

get_icon() {
    case "$1" in
        performance) echo "" ;;
        balanced) echo "" ;;
        power-saver) echo "" ;;
        low-power) echo "" ;;
        *) echo "" ;;
    esac
}

get_label() {
    case "$1" in
        performance) echo "Performance" ;;
        balanced) echo "Balanced" ;;
        power-saver) echo "Power Saver" ;;
        low-power) echo "Low Power" ;;
        *) echo "$1" ;;
    esac
}

get_label_ru() {
    case "$1" in
        performance) echo "Макс. производительность" ;;
        balanced) echo "Сбалансированный" ;;
        power-saver) echo "Экономия энергии" ;;
        low-power) echo "Экономия энергии" ;;
        *) echo "$1" ;;
    esac
}

get_bat_icon() {
    local cap=$1 stat=$2
    [ "$stat" = "Charging" ] && echo "󰂄" && return
    [ "$cap" -ge 90 ] && echo "󰁹" && return
    [ "$cap" -ge 80 ] && echo "󰂂" && return
    [ "$cap" -ge 70 ] && echo "󰂁" && return
    [ "$cap" -ge 60 ] && echo "󰂀" && return
    [ "$cap" -ge 50 ] && echo "󰁿" && return
    [ "$cap" -ge 40 ] && echo "󰁾" && return
    [ "$cap" -ge 30 ] && echo "󰁽" && return
    [ "$cap" -ge 20 ] && echo "󰁼" && return
    echo "󰁺"
}

BAT_ICON=$(get_bat_icon "$BAT_CAP" "$BAT_STATUS")
STATUS_STR=""
[ "$BAT_STATUS" = "Charging" ] && STATUS_STR=" (Charging)"

options=""
for mode in $AVAILABLE; do
    icon=$(get_icon "$mode")
    label_ru=$(get_label_ru "$mode")
    if [ "$mode" = "$CURRENT" ]; then
        options+="✓ ${icon}  ${label_ru}\n"
    else
        options+="  ${icon}  ${label_ru}\n"
    fi
done

selected=$(echo -e "$options" | wofi -d -p "${BAT_ICON}  ${BAT_CAP}%${STATUS_STR}" -W 500 -H 350)

[ -z "$selected" ] && exit 0

for mode in $AVAILABLE; do
    label_ru=$(get_label_ru "$mode")
    if echo "$selected" | grep -q "$label_ru"; then
        pkexec sh -c "echo '$mode' > $PROFILE_FILE" 2>/dev/null
        sleep 0.3
        NEW=$(cat "$PROFILE_FILE" 2>/dev/null)
        if [ "$NEW" = "$mode" ]; then
            notify-send -u low "$(get_icon $mode) Power Profile" "$(get_label $mode)"
        else
            notify-send -u critical "Ошибка" "Не удалось переключить режим"
        fi
        break
    fi
done
