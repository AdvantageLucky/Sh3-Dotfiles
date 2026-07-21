#!/bin/bash
# tooltip for custom/clock 
# rotative phrases. thats it. lol

PHRASES=(
  "Hello, my World!"
  "I can feel the hearts beating as one"
  "Leaves Turn Inside You"
  "Farewell Transmission"
)

TIME=$(date '+%H:%M | %d %b')
TOOLTIP="${PHRASES[$RANDOM % ${#PHRASES[@]}]}"

printf '{"text":"󰅐  %s","tooltip":"%s"}\n' "$TIME" "$TOOLTIP"
