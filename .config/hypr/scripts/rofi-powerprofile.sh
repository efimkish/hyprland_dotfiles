#!/bin/bash

choice=$(printf " performance\n balanced\n power-saver\n" | \
rofi -dmenu -theme ~/.config/rofi/themes/endeavour-rounded.rasi)

case "$choice" in
  *performance*) powerprofilesctl set performance ;;
  *balanced*) powerprofilesctl set balanced ;;
  *power-saver*) powerprofilesctl set power-saver ;;
esac
