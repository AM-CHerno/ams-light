#!/bin/bash
if pgrep -x slurp > /dev/null; then
    pkill -x slurp
    pkill -x hyprpicker
    exit 0
fi

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
FILENAME="screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

hyprpicker -r -z &
FREEZE_PID=$!
sleep 0.2

GEOM=$(slurp -d -b 00000066 -c 00000000)

kill "$FREEZE_PID" 2>/dev/null

if [ -z "$GEOM" ]; then
    exit 0
fi

grim -g "$GEOM" "$SCREENSHOT_DIR/$FILENAME"

if [ -s "$SCREENSHOT_DIR/$FILENAME" ]; then
    wl-copy < "$SCREENSHOT_DIR/$FILENAME"
    notify-send "Screenshot saved" "$SCREENSHOT_DIR/$FILENAME"
else
    rm -f "$SCREENSHOT_DIR/$FILENAME"
fi
