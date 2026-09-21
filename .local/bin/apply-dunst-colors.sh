#!/bin/bash
source ~/.cache/wal/colors.sh

cat > ~/.config/dunst/dunstrc << DUNSTEOF
[global]
    monitor = 0
    follow = mouse
    width = 300
    height = (0, 300)
    origin = top-right
    offset = (10, 50)
    scale = 0
    notification_limit = 5

    progress_bar = true
    progress_bar_height = 10
    progress_bar_frame_width = 1
    progress_bar_min_width = 150
    progress_bar_max_width = 300

    indicate_hidden = yes
    transparency = 0
    separator_height = 2
    padding = 12
    horizontal_padding = 12
    text_icon_padding = 0
    frame_width = 2
    frame_color = "${color1}"
    separator_color = frame
    sort = yes
    idle_threshold = 120

    font = JetBrainsMono Nerd Font 10
    line_height = 0
    markup = full
    format = "<b>%s</b>\n%b"
    alignment = left
    vertical_alignment = center
    show_age_threshold = 60
    ellipsize = middle
    ignore_newline = no
    stack_duplicates = true
    hide_duplicate_count = false
    show_indicators = yes

    icon_position = left
    min_icon_size = 32
    max_icon_size = 64

    sticky_history = yes
    history_length = 20

    dmenu = rofi -dmenu -p dunst
    browser = xdg-open

    always_run_script = true
    title = Dunst
    class = Dunst

    corner_radius = 12
    ignore_dbusclose = false

    mouse_left_click = close_current
    mouse_middle_click = do_action, close_current
    mouse_right_click = close_all

[experimental]
    per_monitor_dpi = false

[urgency_low]
    background = "${background}"
    foreground = "${foreground}"
    timeout = 5

[urgency_normal]
    background = "${background}"
    foreground = "${foreground}"
    timeout = 8

[urgency_critical]
    background = "${background}"
    foreground = "${color1}"
    frame_color = "${color1}"
    timeout = 0
DUNSTEOF

pkill -x dunst
setsid dunst > /dev/null 2>&1 &
disown
SCRIPTEOF
chmod +x ~/.local/bin/apply-dunst-colors.sh
