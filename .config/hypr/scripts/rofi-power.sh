#!/bin/bash

choice=$(printf "⏻ Shutdown\n Reboot\n Suspend\n Lock\n" | \
rofi -dmenu -theme ~/.config/rofi/themes/endeavour-rounded.rasi)

case "$choice" in
  *Shutdown*) poweroff ;;
  *Reboot*) reboot ;;
  *Suspend*) systemctl suspend ;;
  *Lock*) hyprlock ;;
esac
