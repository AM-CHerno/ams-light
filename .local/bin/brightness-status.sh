#!/bin/bash
if [ -f /tmp/brightness_cache ]; then
    BRIGHTNESS=$(cat /tmp/brightness_cache)
else
    BRIGHTNESS=$(ddcutil --sleep-multiplier 0.1 getvcp 10 | grep -oP 'current value = \s*\K[0-9]+')
    echo "$BRIGHTNESS" > /tmp/brightness_cache
fi
echo "{\"text\": \"${BRIGHTNESS}%\", \"tooltip\": \"Brightness: ${BRIGHTNESS}%\"}"
