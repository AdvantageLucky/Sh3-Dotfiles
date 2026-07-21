#!/bin/bash

# opens floating term for yay/pacman updates
exec kitty --app-id floating_update -e sh -c '
    yay
    pkill -RTMIN+9 waybar
    echo
    read -n1 -s -r -p "Listo. Pulsa cualquier tecla para cerrar..."
'
