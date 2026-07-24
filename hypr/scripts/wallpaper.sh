#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

mkdir -p "$WALLPAPER_DIR"

mapfile -t files < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.bmp' -o -iname '*.webp' \) -printf '%f\n' | sort)

if [ ${#files[@]} -eq 0 ]; then
    notify-send "Wallpapers" "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

selected=$(printf '%s\n' "${files[@]}" | wofi -d -p "Wallpaper" -W 30%)

[ -z "$selected" ] && exit 0

wallpaper="$WALLPAPER_DIR/$selected"

if [ -f "$wallpaper" ]; then
    swww img "$wallpaper" --transition-type grow --transition-pos 0.5,0.5 --transition-duration 0.5
    notify-send "Wallpaper" "Set to $selected"
fi
