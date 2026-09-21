# AM's Light Dotfiles

A minimal, custom-built Hyprland rice (Lua config) with dynamic wallpaper-based theming via pywal — rofi, waybar, dunst, hyprlock, and kitty all shift color palette together on wallpaper change.

## Stack
- **WM**: Hyprland (Lua config)
- **Bar**: Waybar
- **Launcher**: Rofi
- **Notifications**: Dunst
- **Lock screen**: Hyprlock + Hypridle
- **Terminal**: Kitty
- **File manager**: Yazi
- **Wallpaper**: awww
- **Color theming**: pywal
- **Clipboard**: cliphist (via systemd user services)

## Dependencies

```bash
sudo pacman -S hyprland waybar rofi dunst hyprlock hypridle kitty yazi \
  awww python-pywal cliphist wl-clipboard grim slurp hyprpicker \
  pamixer ddcutil networkmanager bluez bluez-utils jq \
  ttf-jetbrains-mono-nerd noto-fonts-cjk
```

## Installation

```bash
git clone https://github.com/AM-CHerno/ams-light.git ~/ams-light
cd ~/ams-light
./install.sh
```

2. Copy configs into place:
```bash
   cp -r ~/dotfiles-source/.config/* ~/.config/
   cp -r ~/dotfiles-source/.local/bin/* ~/.local/bin/
   chmod +x ~/.local/bin/*.sh ~/.local/bin/gpu-replay
```

3. Add your own wallpapers to `~/Pictures/wallpapers/`

4. Enable the clipboard services:
```bash
   systemctl --user daemon-reload
   systemctl --user enable --now cliphist-text.service cliphist-image.service
```

5. Reload Hyprland:
```bash
   hyprctl reload
```

## Notes
- All colors regenerate automatically via `apply-*-colors.sh` scripts, triggered on wallpaper change (`SUPER+SHIFT+W`) and on session start.
- Brightness control uses DDC/CI (`ddcutil`) for external monitors — adjust `getvcp`/`setvcp` codes if your monitor differs.
