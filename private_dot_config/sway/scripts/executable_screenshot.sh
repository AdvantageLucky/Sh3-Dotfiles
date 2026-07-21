#!/bin/bash

# Screenshot: full | selection
# Capture, open swappy to annotate, copy to clipboard and notify.

DIR=~/Pictures/Screenshots
mkdir -p "$DIR"

case $1 in
    full)
        FILE="$DIR/full_$(date +'%Y-%m-%d_%H-%M-%S').png"
        grim "$FILE"
        TITLE="📷 Capturado"
        MSG="Otro instante guardado."
        ;;
    selection)
        FILE="$DIR/area_$(date +'%Y-%m-%d_%H-%M-%S').png"
        # cancelling slurp (Esc) must not leave a file or notify
        grim -g "$(slurp)" "$FILE" || exit 0
        TITLE="📷 Recorte"
        MSG="Un fragmento, guardado."
        ;;
    *)
        exit 1
        ;;
esac

swappy -f "$FILE" -o "$FILE"
wl-copy -t image/png < "$FILE"
notify-send -a "System" -i "$FILE" "$TITLE" "$MSG"
