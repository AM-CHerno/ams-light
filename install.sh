#!/bin/bash
set -e

echo "==> Syncing package databases..."
sudo pacman -Syu --noconfirm || {
    echo "==> Sync had issues (possibly a slow mirror), continuing anyway..."
}

echo "==> Installing official repo packages..."
sudo pacman -S --needed hyprland waybar rofi dunst hyprlock hypridle kitty yazi \
  awww cliphist wl-clipboard grim slurp hyprpicker \
  pamixer ddcutil networkmanager bluez bluez-utils jq \
  ttf-jetbrains-mono-nerd noto-fonts-cjk qt5ct qt6ct nwg-look \
  btop task blueman kcalc pavucontrol gwenview vim mpv starship haruna discord thunar tumbler ffmpegthumbnailer poppler-glib libgsf less

echo "==> Checking for paru (AUR helper)..."
if ! command -v paru &> /dev/null; then
    echo "paru not found, installing..."
    sudo pacman -S --needed base-devel git
    rm -rf /tmp/paru-install
    git clone https://aur.archlinux.org/paru.git /tmp/paru-install
    (cd /tmp/paru-install && makepkg -si --noconfirm)
    rm -rf /tmp/paru-install
fi

echo "==> Installing AUR packages..."
paru -S --needed firefox vscodium-bin \
   gpu-screen-recorder-ui gpu-screen-recorder obsidian equicord-installer-bin neofetch nmgui-bin python-pywal arduino-ide-bin photoflare

echo "==> Copying dotfiles..."
mkdir -p ~/.config ~/.local/bin
cp -r "$(dirname "$0")/.config/"* ~/.config/
cp -r "$(dirname "$0")/.local/bin/"* ~/.local/bin/
if [ -f "$(dirname "$0")/.bashrc" ]; then
    cp "$(dirname "$0")/.bashrc" ~/.bashrc
fi
chmod +x ~/.local/bin/*.sh
chmod +x ~/.local/bin/gpu-replay

echo "==> Installing Cipher..."
CIPHER_REPO=https://github.com/Hirafay/cipher.git
CIPHER_SRC="$HOME/.local/src/cipher"
CIPHER_COMMIT=""

sudo pacman -S --needed base-devel git python rsync

export NVM_DIR="$HOME/.nvm"
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
set +e
. "$NVM_DIR/nvm.sh"
set -e
nvm install 20

mkdir -p "$(dirname "$CIPHER_SRC")"
if [ -d "$CIPHER_SRC/.git" ]; then
    git -C "$CIPHER_SRC" fetch
else
    git clone "$CIPHER_REPO" "$CIPHER_SRC"
fi
if [ -n "$CIPHER_COMMIT" ]; then
    git -C "$CIPHER_SRC" checkout "$CIPHER_COMMIT"
fi
(cd "$CIPHER_SRC" && npm install && cd src && npm install)
chmod +x ~/.local/bin/cipher

echo "==> Adding Cipher to the app launcher..."
mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/cipher.desktop <<DESKTOP
[Desktop Entry]
Type=Application
Name=Cipher
Comment=Sci-fi recon terminal
Exec=$HOME/.local/bin/cipher
Icon=utilities-terminal
Terminal=false
Categories=Utility;System;
DESKTOP

echo "==> Creating directories..."
mkdir -p ~/Pictures/wallpapers ~/Pictures/Screenshots

echo "==> Setting up default wallpaper..."
if [ ! -f ~/Pictures/wallpapers/default.jpg ]; then
    cp "$(dirname "$0")/Pictures/wallpapers/default.jpg" ~/Pictures/wallpapers/
fi

echo "==> Enabling clipboard services..."
systemctl --user daemon-reload
systemctl --user enable --now cliphist-text.service cliphist-image.service

echo "==> Enabling bluetooth service..."
sudo systemctl enable --now bluetooth

echo "==> Adding user to serial port group for Arduino..."
sudo usermod -aG uucp "$USER"

echo ""
echo "Done. Add wallpapers to ~/Pictures/wallpapers/ then run: hyprctl reload"
echo "To finish Equicord setup, run: equicord-installer"
echo "Then in Discord: Vencord Settings > Themes > enable 'translucence-customized'"
