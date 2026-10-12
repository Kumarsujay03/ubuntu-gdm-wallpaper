#!/usr/bin/env bash
# Installs gdm-wallpaper to /usr/local/bin
set -euo pipefail
URL="https://raw.githubusercontent.com/Kumarsujay03/ubuntu-gdm-wallpaper/main/gdm-wallpaper"
DEST="/usr/local/bin/gdm-wallpaper"

if ! command -v glib-compile-resources >/dev/null 2>&1; then
    echo "==> Installing dependency: libglib2.0-dev-bin"
    sudo apt-get install -y libglib2.0-dev-bin
fi

echo "==> Downloading gdm-wallpaper"
tmp="$(mktemp)"; trap 'rm -f "$tmp"' EXIT
curl -fsSL "$URL" -o "$tmp"
sudo install -m 755 "$tmp" "$DEST"

echo "==> Installed to $DEST"
echo
echo "Try it:  gdm-wallpaper set ~/Pictures/my-wallpaper.jpg"
