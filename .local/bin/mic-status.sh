#!/bin/bash
MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -o "yes\|no")
if [ "$MUTED" = "yes" ]; then
    echo "󰍭"
else
    echo "󰍬"
fi
