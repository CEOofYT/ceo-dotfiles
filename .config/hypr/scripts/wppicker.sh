#!/usr/bin/env bash

if pidof rofi > /dev/null; then
    pkill rofi
fi

wallpapers_dir="$HOME/Pictures/Wallpapers"
symlink_path="$HOME/.config/hypr/current_wallpaper"

selected_wallpaper=$(for a in "$wallpapers_dir"/*; do
    echo -en "$(basename "${a%.*}")\0icon\x1f$a\n"
done | rofi -dmenu -p "Seleccionar Wallpaper ")

[ -z "$selected_wallpaper" ] && exit 1

image_fullname_path=$(find "$wallpapers_dir" -type f -name "$selected_wallpaper.*" | head -n 1)

swww img "$image_fullname_path" --transition-type any --transition-duration 2

ln -sf "$image_fullname_path" "$symlink_path"

matugen image "$image_fullname_path"
swaync-client -rs
killall -SIGUSR2 waybar
hyprctl reload