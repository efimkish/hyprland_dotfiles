#!/bin/bash

entries="⏻ Shutdown\n Reboot\n Suspend\n Lock"

selected=$(echo -e "$entries" | wofi -d -p "Power" -W 400 -H 300)

case "$selected" in
  *Shutdown*) systemctl poweroff ;;
  *Reboot*) systemctl reboot ;;
  *Suspend*) systemctl suspend ;;
  *Lock*) ~/.config/hypr/scripts/lock.sh ;;
esac
