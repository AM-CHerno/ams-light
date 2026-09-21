#!/bin/bash
set -e

echo "Installing dotfiles..."
cp -r ~/dotfiles-source/.config/* ~/.config/
cp -r ~/dotfiles-source/.local/bin/* ~/.local/bin/
chmod +x ~/.local/bin/*.sh
chmod +x ~/.local/bin/gpu-replay

mkdir -p ~/Pictures/wallpapers ~/Pictures/Screenshots

systemctl --user daemon-reload
systemctl --user enable --now cliphist-text.service cliphist-image.service

echo "Done. Add wallpapers to ~/Pictures/wallpapers/ and run: hyprctl reload"
