#!/bin/bash
set -e

echo "==> Syncing package databases..."
sudo pacman -Syu --noconfirm

echo "==> Installing official repo packages..."
sudo pacman -S --needed hyprland waybar rofi dunst hyprlock hypridle kitty yazi \
  awww cliphist wl-clipboard grim slurp hyprpicker \
  pamixer ddcutil networkmanager bluez bluez-utils jq \
  ttf-jetbrains-mono-nerd noto-fonts-cjk qt5ct qt6ct nwg-look \
  btop task blueman kcalc pavucontrol gwenview vim mpv discord

echo "==> Checking for paru (AUR helper)..."
if ! command -v paru &> /dev/null; then
    echo "paru not found, installing..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru-install
    (cd /tmp/paru-install && makepkg -si --noconfirm)
    rm -rf /tmp/paru-install
fi

echo "==> Installing AUR packages..."
paru -S --needed spotify vscodium-bin zen-browser heroic-games-launcher-bin \
  onlyoffice-bin gpu-screen-recorder obsidian equicord-installer-bin neofetch python-pywal

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
echo "To finish Equicord setup, run: equicord-installer"
echo "Then in Discord: Vencord Settings > Themes > enable 'translucence-customized'"
