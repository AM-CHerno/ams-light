#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.config/waybar/style.css << CSSEOF
* {
    font-family: "JetBrainsMono Nerd Font", sans-serif;
    font-size: 13px;
    min-height: 0;
}
window#waybar {
    background: transparent;
}
#custom-launcher,
#tray,
#clock,
#custom-weather,
#network,
#bluetooth,
#pulseaudio,
#custom-mic,
#custom-brightness,
#backlight {
    background-color: ${background};
    color: ${foreground};
    padding: 4px 12px;
    margin: 2px;
    border-radius: 12px;
}
#custom-launcher {
    color: ${color4};
    font-size: 16px;
    padding: 2px 16px 4px 13px;
    padding-top: 2px;
}
#clock {
    font-weight: bold;
}
#workspaces {
    background-color: ${background};
    padding: 4px 8px;
    margin: 2px;
    border-radius: 20px;
}
#workspaces button {
    background-color: ${color1};
    color: #faf0ef;
    font-family: "Noto Sans CJK JP", "Noto Sans JP", sans-serif;
    font-size: 8px;
    font-weight: bold;
    min-width: 20px;
    min-height: 20px;
    padding: 0px;
    margin: 0px 3px;
    border: 0px solid transparent;
    border-radius: 999px;
    outline: none;
    box-shadow: none;
    background-image: none;
    text-shadow: none;
}
#workspaces button label {
    padding: 0px;
    margin: -4px 0px 0px 2px;
}
#workspaces button.active {
    background-color: ${color4};
    color: #232323;
}
#workspaces button.urgent {
    background-color: ${color1};
    color: ${foreground};
}
#workspaces button:hover {
    background-color: ${color2};
    color: ${foreground};
}
#bluetooth:hover,
#pulseaudio:hover,
#custom-mic:hover,
#custom-brightness:hover,
#backlight:hover {
    background-color: ${color2};
}
CSSEOF

cat > ~/.config/waybar/config.jsonc << CONFIGEOF
{
    "layer": "top",
    "position": "top",
    "height": 34,
    "spacing": 4,
    "margin-top": 6,
    "margin-left": 10,
    "margin-right": 10,
    "modules-left": ["custom/launcher", "hyprland/workspaces", "tray"],
    "modules-center": ["clock"],
    "modules-right": ["custom/weather", "network", "bluetooth", "pulseaudio", "custom/brightness", "custom/mic"],
    "custom/launcher": {
        "format": "󰣇",
        "on-click": "$HOME/.local/bin/app-launcher.sh",
        "tooltip": false
    },
    "hyprland/workspaces": {
        "format": "{icon}",
        "format-icons": {
            "1": "一",
            "2": "二",
            "3": "三",
            "4": "四",
            "5": "五",
            "6": "六",
            "7": "七",
            "8": "八",
            "9": "九",
            "10": "十"
        },
        "persistent-workspaces": {
            "*": [1, 2, 3, 4, 5]
        },
        "on-click": "activate"
    },
    "tray": {
        "icon-size": 16,
        "spacing": 8
    },
    "clock": {
        "format": "{:%I:%M %p}",
        "tooltip-format": "{calendar}",
        "calendar": {
            "mode": "month",
            "mode-mon-col": 3,
            "weeks-pos": "",
            "on-scroll": 1,
            "on-click-right": "mode",
            "format": {
                "months": "<span color='${color4}'><b>{}</b></span>",
                "days": "<span color='${foreground}'>{}</span>",
                "weekdays": "<span color='${color8}'><b>{}</b></span>",
                "today": "<span color='${background}' background='${color4}'><b>{}</b></span>"
            }
        }
    },
    "custom/weather": {
        "exec": "$HOME/.local/bin/weather.sh",
        "return-type": "json",
        "interval": 900,
        "tooltip": true
    },
    "network": {
        "format-wifi": "󰤨  {essid}",
        "format-ethernet": "󰈀  Wired",
        "format-disconnected": "󰤭  Off",
        "tooltip-format": "{ifname}: {ipaddr}"
    },

    "bluetooth": {
    "format-on": "󰂯",
    "format-off": "󰂲",
    "format-disabled": "󰂲",
    "format-connected": "󰂱  {num_connections}",
    "tooltip-format": "{controller_alias}: {status}",
    "on-click": "$HOME/.local/bin/bluetooth-toggle.sh",
    "signal": 9
    },

    "pulseaudio": {
        "format": "{icon}  {volume}%",
        "format-muted": "󰝟",
        "format-icons": {
            "default": ["󰕿", "󰖀", "󰕾"]
        },
        "scroll-step": 5,
        "on-click": "pamixer -t",
        "on-click-right": "pavucontrol"
    },
    "custom/brightness": {
        "exec": "$HOME/.local/bin/brightness-status.sh",
        "return-type": "json",
        "interval": 5,
        "on-scroll-up": "$HOME/.local/bin/brightness-up.sh",
        "on-scroll-down": "$HOME/.local/bin/brightness-down.sh",
        "format": "󰃟  {}"
    },
    "custom/mic": {
        "exec": "$HOME/.local/bin/mic-status.sh",
        "interval": 1,
        "on-click": "pactl set-source-mute @DEFAULT_SOURCE@ toggle",
        "tooltip": false
    }
}
CONFIGEOF

pkill -x waybar
waybar &
