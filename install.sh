#!/bin/bash
set -e

echo "==> Installing packages..."
sudo pacman -S --needed hyprland waybar rofi dunst hyprlock hypridle kitty yazi \
  awww python-pywal cliphist wl-clipboard grim slurp hyprpicker \
  pamixer ddcutil networkmanager bluez bluez-utils jq \
  ttf-jetbrains-mono-nerd noto-fonts-cjk qt5ct qt6ct nwg-look

echo "==> Copying dotfiles..."
cp -r "$(dirname "$0")/.config/"* ~/.config/
cp -r "$(dirname "$0")/.local/bin/"* ~/.local/bin/
chmod +x ~/.local/bin/*.sh
chmod +x ~/.local/bin/gpu-replay

echo "==> Creating directories..."
mkdir -p ~/Pictures/wallpapers ~/Pictures/Screenshots

echo "==> Enabling clipboard services..."
systemctl --user daemon-reload
systemctl --user enable --now cliphist-text.service cliphist-image.service

echo "==> Enabling bluetooth service..."
sudo systemctl enable --now bluetooth

echo ""
echo "Done. Add wallpapers to ~/Pictures/wallpapers/ then run: hyprctl reload"
