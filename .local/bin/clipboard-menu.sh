#!/bin/bash
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi
cliphist list | rofi -dmenu | cliphist decode | wl-copy
