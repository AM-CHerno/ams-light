#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.config/hypr/hyprlock.conf << HYPRLOCKEOF
general {
    disable_loading_bar = false
    grace = 0
    hide_cursor = true
    no_fade_in = false
}

background {
    monitor =
    path = screenshot
    blur_passes = 3
    blur_size = 8
    noise = 0.0117
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}

input-field {
    monitor =
    size = 250, 60
    outline_thickness = 3
    dots_size = 0.26
    dots_spacing = 0.3
    dots_center = true
    dots_fade_time = 200
    outer_color = rgb(${color1#\#})
    inner_color = rgb(${background#\#})
    font_color = rgb(${foreground#\#})
    check_color = rgb(${color4#\#})
    fail_color = rgb(${color1#\#})
    fade_on_empty = true
    placeholder_text = <i>Password...</i>
    hide_input = false
    position = 0, -20
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "\$(date +'%I:%M %p')"
    color = rgb(${foreground#\#})
    font_size = 64
    font_family = JetBrainsMono Nerd Font
    position = 0, 150
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:1000] echo "\$(date +'%A, %B %d')"
    color = rgb(${color4#\#})
    font_size = 20
    font_family = JetBrainsMono Nerd Font
    position = 0, 80
    halign = center
    valign = center
}
HYPRLOCKEOF
