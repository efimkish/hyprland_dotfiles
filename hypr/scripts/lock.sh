#!/bin/bash

CACHE_DIR="$HOME/.cache/hyprlock"
CURRENT_WALL="$CACHE_DIR/current-wallpaper"
DEFAULT_WALL="$HOME/Pictures/wallpapers/синий.jpg"

mkdir -p "$CACHE_DIR"

WALL=$(swww query 2>/dev/null | grep -oP '/[^\s]+\.(jpg|jpeg|png)' | head -1)

if [ -n "$WALL" ] && [ -f "$WALL" ]; then
    cp "$WALL" "$CURRENT_WALL"
else
    cp "$DEFAULT_WALL" "$CURRENT_WALL"
fi

hyprlock
