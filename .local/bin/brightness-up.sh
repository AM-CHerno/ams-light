#!/bin/bash
CURRENT=$(cat /tmp/brightness_cache 2>/dev/null || echo 50)
NEW=$((CURRENT + 5))
[ "$NEW" -gt 100 ] && NEW=100
echo "$NEW" > /tmp/brightness_cache
pkill -RTMIN+8 waybar

TOKEN=$(date +%s%N)
echo "$TOKEN" > /tmp/brightness_token

(
    sleep 1
    LATEST_TOKEN=$(cat /tmp/brightness_token)
    if [ "$TOKEN" = "$LATEST_TOKEN" ]; then
        FINAL=$(cat /tmp/brightness_cache)
        ddcutil --sleep-multiplier 0.1 --noverify setvcp 10 "$FINAL"
    fi
) &
