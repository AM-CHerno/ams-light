#!/bin/bash
set -e

REPO_URL="https://github.com/AM-CHerno/ams-light.git"
CLONE_DIR="$HOME/ams-light"

if ! command -v git &> /dev/null; then
    echo "==> Installing git..."
    sudo pacman -S --needed git
fi

if [ -d "$CLONE_DIR" ]; then
    echo "==> $CLONE_DIR already exists, pulling latest..."
    git -C "$CLONE_DIR" pull
else
    echo "==> Cloning dotfiles..."
    git clone "$REPO_URL" "$CLONE_DIR"
fi

chmod +x "$CLONE_DIR/install.sh"
"$CLONE_DIR/install.sh"
