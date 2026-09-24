hl.monitor({
    output   = "",
    mode     = "1920x1080@165",
    position = "auto",
    scale    = "auto",
})
local terminal = "kitty"
local fileManager = "kitty -e yazi"
local menu = "$HOME/.local/bin/app-launcher.sh"
hl.on("hyprland.start", function()
hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_RUNTIME_DIR HYPRLAND_INSTANCE_SIGNATURE")
hl.exec_cmd("systemctl --user restart cliphist-text.service cliphist-image.service")
hl.exec_cmd("pgrep -x waybar || waybar")
hl.exec_cmd("pgrep -x awww-daemon || awww-daemon")
hl.exec_cmd("pkill -x dunst; dunst &")
hl.exec_cmd("WP=$(cat ~/.cache/last_wallpaper 2>/dev/null); if [ -z \"$WP\" ] || [ ! -f \"$WP\" ]; then WP=~/Pictures/wallpapers/default.jpg; fi; echo \"$WP\" > ~/.cache/last_wallpaper; sleep 1; awww img \"$WP\"")
hl.exec_cmd("sleep 2; WP=$(cat ~/.cache/last_wallpaper); wal -i \"$WP\" -n")
hl.exec_cmd("sleep 3; ~/.local/bin/apply-rofi-colors.sh")
hl.exec_cmd("sleep 3; ~/.local/bin/apply-waybar-colors.sh")
hl.exec_cmd("sleep 3; ~/.local/bin/apply-dunst-colors.sh")
hl.exec_cmd("sleep 3; ~/.local/bin/apply-hyprlock-colors.sh")
hl.exec_cmd("pgrep -x hypridle || hypridle")
hl.exec_cmd("pgrep -x gsr-ui || gsr-ui launch-hide-announce")
end)
hl.config({
    input = {
        kb_layout = "us,ara",
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        sensitivity = 0,
        repeat_rate = 50,
        repeat_delay = 200,
        touchpad = {
            natural_scroll = false,
        },
    },
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})
local mainMod = "SUPER"
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("$HOME/.local/bin/random-wallpaper.sh"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("$HOME/.local/bin/wallpaper-picker"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("$HOME/.local/bin/screenshot.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("$HOME/.local/bin/clipboard-menu.sh"))
hl.exec_cmd("pgrep -f 'wl-paste --type text --watch cliphist' || wl-paste --type text --watch cliphist store")
hl.exec_cmd("pgrep -f 'wl-paste --type image --watch cliphist' || wl-paste --type image --watch cliphist store")
--Universal Blur
hl.config({
    decoration = {
        active_opacity = 0.85,
        inactive_opacity = 0.85,
    },
})
-- Force full opacity for these apps, ignoring the global rule above
hl.window_rule({
    match = { class = "^(zen|org.gnome.Boxes|steam|google-chrome|VirtualBox Machine|discord|kitty|wps|ONLYOFFICE|libreoffice.*)$" },
    opacity = "1.0 override 1.0 override",
})
--Special workspaces (hidden unless actively toggled open)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("s"))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("d"))
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 8,
    bezier = "default",
    style = "slidevert -100%",
})
