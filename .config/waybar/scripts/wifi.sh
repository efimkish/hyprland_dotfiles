#!/usr/bin/env bash

# Проверяем, установлен ли rofi
if ! command -v rofi &> /dev/null; then
    notify-send "Ошибка" "Rofi не установлен"
    exit 1
fi

# Получаем список сетей (удаляем пустые строки и дубликаты)
# Формат: "SSID  (Strength)"
list=$(nmcli --fields "SSID,BARS" device wifi list | sed 1d | sed 's/  */ /g' | sed -n "/^--/!p" | uniq)

# Показываем меню Rofi
chosen_network=$(echo -e "$list" | rofi -dmenu -i -p "Wi-Fi" -width 30)

# Если ничего не выбрано, выходим
if [ -z "$chosen_network" ]; then
    exit 0
fi

# Получаем имя сети (первое слово)
ssid=$(echo "$chosen_network" | awk '{print $1}')

# Пробуем подключиться
# Если сеть сохранена, подключится сразу. Если нет — можно запустить терминал для ввода пароля (сложнее),
# но для простоты запустим nm-connection-editor или nmtui, если простого подключения мало.
# Попытка авто-подключения:
nmcli device wifi connect "$ssid" || alacritty -e nmtui # Замени alacritty на свой терминал (kitty/foot)
