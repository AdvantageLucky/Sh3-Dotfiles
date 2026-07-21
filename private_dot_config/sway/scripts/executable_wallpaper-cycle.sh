#!/bin/bash

# wallpapers in ~/Pictures/wallpapers/ 
# selected wallpaper persists in ~/.config/sway/wallpaper/wallpaper.conf (only the PATH persists)

DIR="$HOME/Pictures/wallpapers"
CONF="$HOME/.config/sway/wallpaper/wallpaper.conf"

mapfile -t walls < <(find "$DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) | sort)
[[ ${#walls[@]} -eq 0 ]] && exit 1

current=$(grep -oP 'bg \K\S+' "$CONF" 2>/dev/null)
current="${current/#\~/$HOME}"

next="${walls[0]}"
for i in "${!walls[@]}"; do
    if [[ "${walls[$i]}" == "$current" ]]; then
        next="${walls[$(((i + 1) % ${#walls[@]}))]}"
        break
    fi
done

printf '# @Wallpaper\noutput * bg %s fill\n' "${next/#$HOME/\~}" >"$CONF"

# we need to wait 0.5 for full changes
(
    sleep 0.5
    swaymsg output '*' bg "$next" fill
    pkill -RTMIN+8 waybar
) &
