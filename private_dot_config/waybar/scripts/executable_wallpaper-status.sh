#!/bin/bash
# tooltip for custom/wallpaper: it shows current wallpaper name

wp=$(grep -oP 'bg \K\S+' "$HOME/.config/sway/wallpaper/wallpaper.conf" 2>/dev/null)
printf '{"text": "", "tooltip": "Cambiar wallpaper\\nActual: %s"}\n' "$(basename "${wp:-ninguno}")"
