#!/bin/bash

STATE_FILE="/tmp/waybar_calendar_state"

[ ! -f "$STATE_FILE" ] && echo "clock" > "$STATE_FILE"

STATE=$(cat "$STATE_FILE")

case "$1" in
    "toggle")
        case "$STATE" in
            clock) echo "date" ;;
            date) echo "clock" ;;
        esac > "$STATE_FILE"
        ;;
    "open")
        exec ~/.config/hypr/scripts/wofi/wofi-calendar.sh
        ;;
esac

STATE=$(cat "$STATE_FILE")

case "$STATE" in
    clock)  echo "  $(date +'%H:%M')" ;;
    date)   echo "  $(date +'%-d %B' | sed 's/January/января/;s/February/февраля/;s/March/марта/;s/April/апреля/;s/May/мая/;s/June/июня/;s/July/июля/;s/August/августа/;s/September/сентября/;s/October/октября/;s/November/ноября/;s/December/декабря/')" ;;
esac
