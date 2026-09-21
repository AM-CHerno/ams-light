#!/bin/bash
data=$(curl -s "https://wttr.in/?format=j1" 2>/dev/null)
if [ -z "$data" ]; then
    echo '{"text": "N/A", "tooltip": "Weather unavailable"}'
    exit 0
fi
location=$(echo "$data" | jq -r '.nearest_area[0].areaName[0].value')
current_temp=$(echo "$data" | jq -r '.current_condition[0].temp_C')
current_desc=$(echo "$data" | jq -r '.current_condition[0].weatherDesc[0].value')
tmr_max=$(echo "$data" | jq -r '.weather[1].maxtempC')
tmr_min=$(echo "$data" | jq -r '.weather[1].mintempC')
tmr_desc=$(echo "$data" | jq -r '.weather[1].hourly[4].weatherDesc[0].value')
jq -nc --arg text "$current_desc $current_temp°C" \
      --arg tooltip "$location
Today: $current_desc, $current_temp°C
Tomorrow: $tmr_desc, $tmr_min°C - $tmr_max°C" \
      '{text: $text, tooltip: $tooltip}'
