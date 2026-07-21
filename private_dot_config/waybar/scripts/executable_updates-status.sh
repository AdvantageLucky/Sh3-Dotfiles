#!/bin/bash
# tooltip for custom/updates: it counts pending updates from pacman/aur

repo=$(checkupdates 2>/dev/null | wc -l)
aur=$(yay -Qua 2>/dev/null | wc -l)
total=$((repo + aur))

if ((total == 0)); then
    estado="Sistema al día"
else
    estado="$total paquetes pendientes ($repo repos, $aur AUR)"
fi

printf '{"text": "", "tooltip": "Actualizar sistema (yay)\\n%s"}\n' "$estado"
