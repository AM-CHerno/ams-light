#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
awww img "$WALLPAPER" --transition-type wipe --transition-duration 1
wal -i "$WALLPAPER" -n
echo "$WALLPAPER" > "$HOME/.cache/last_wallpaper"
~/.local/bin/apply-rofi-colors.sh
~/.local/bin/apply-waybar-colors.sh
~/.local/bin/apply-dunst-colors.sh
~/.local/bin/apply-hyprlock-colors.sh
