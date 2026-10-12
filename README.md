# ubuntu-gdm-wallpaper

Change the **Ubuntu login screen (GDM) wallpaper** with one command — with a
modern glass-style login box, and automatic backups so you can always go back.

Tested on **Ubuntu 26.04 LTS** (GNOME Shell 50, GDM 50, Wayland). Should work
on any Ubuntu release that uses the Yaru GDM theme.

## Features

- 🖼️ One command to set any JPG, PNG, WEBP, AVIF or HEIC image as the login wallpaper
- 🪟 Glass/transparent user list, password field and buttons (optional)
- ↩️ `undo` to go back to the previous login screen
- 🛟 `reset` to restore the original Ubuntu login screen
- 🔒 The original theme is backed up once and never overwritten

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/Kumarsujay03/ubuntu-gdm-wallpaper/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/Kumarsujay03/ubuntu-gdm-wallpaper.git
cd ubuntu-gdm-wallpaper
sudo install -m 755 gdm-wallpaper /usr/local/bin/
```

Requires `libglib2.0-dev-bin` (`sudo apt install libglib2.0-dev-bin`).
Non-JPG images also need ImageMagick (`sudo apt install imagemagick`).

## Usage

```bash
gdm-wallpaper set ~/Pictures/wallpaper.jpg      # set wallpaper (+ glass style)
gdm-wallpaper set ~/Pictures/wallpaper.png --no-glass   # wallpaper only
gdm-wallpaper undo                              # go back one step
gdm-wallpaper reset                             # original Ubuntu login screen
gdm-wallpaper status                            # show current state
```

Log out or reboot to see the change.

## How it works

GDM's look comes from a compiled theme file
(`/usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource`).
`gdm-wallpaper`:

1. Saves an untouched copy of it the first time (`*.gdm-wallpaper-original`).
2. Extracts the theme, appends a small CSS block to `gdm.css` that sets the
   background to `/usr/share/backgrounds/gdm-wallpaper.jpg`.
3. Recompiles the theme and installs it, keeping the previous one for `undo`.

The CSS block is clearly marked, so running `set` again replaces it instead of
piling up changes.

## If the login screen breaks

Press **Ctrl + Alt + F3**, log in on the text console, and run:

```bash
gdm-wallpaper reset
sudo reboot
```

If that is not possible, reinstall the stock theme:

```bash
sudo apt install --reinstall yaru-theme-gnome-shell
```

> **Note:** A system update to `yaru-theme-gnome-shell` replaces the theme file
> and removes your wallpaper. Just run `gdm-wallpaper set …` again.

## Bonus: 12-hour clock on the login screen

Add this to `/etc/gdm3/greeter.dconf-defaults`, then run `sudo dconf update` and reboot:

```ini
[org/gnome/desktop/interface]
clock-format='12h'
```

## Contributing

This project is open source and contributions are very welcome!
See [CONTRIBUTING.md](CONTRIBUTING.md). Ideas: support for other distros and
themes, more CSS styles, blur options, a GUI.

## License

[MIT](LICENSE) © Kumarsujay03
