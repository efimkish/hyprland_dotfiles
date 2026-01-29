#!/usr/bin/env bash

# Опции
option0="🔒 Блокировка"
option1="⏾ Сон"
option2=" Гибернация"
option3=" Выключение"
option4=" Перезагрузка"
option5=" Макс. производительность"
option6=" Сбалансированный"
option7="r Экономия энергии"

# Вызов меню
options="$option0\n$option1\n$option2\n$option3\n$option4\n---\n$option5\n$option6\n$option7"
selected=$(echo -e "$options" | rofi -dmenu -i -p "Питание" -width 20 -lines 8)

case $selected in
    "$option0") hyprlock ;; # Или swaylock
    "$option1") systemctl suspend ;;
    "$option2") systemctl hibernate ;;
    "$option3") systemctl poweroff ;;
    "$option4") systemctl reboot ;;
    "$option5") powerprofilesctl set performance && notify-send "Режим" "Производительность" ;;
    "$option6") powerprofilesctl set balanced && notify-send "Режим" "Сбалансированный" ;;
    "$option7") powerprofilesctl set power-saver && notify-send "Режим" "Экономия" ;;
esac
