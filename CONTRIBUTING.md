# Contributing

Thanks for wanting to help! All contributions are welcome — bug reports, new
Ubuntu/GNOME version support, CSS styles, docs, and code.

## Reporting a bug

Open an [issue](https://github.com/Kumarsujay03/ubuntu-gdm-wallpaper/issues) and include:

- Output of `gdm-wallpaper status`
- Ubuntu version (`lsb_release -d`) and GNOME version (`gnome-shell --version`)
- The full error message

## Sending a change

1. Fork the repo and create a branch: `git checkout -b my-fix`
2. Make your change in `gdm-wallpaper` (it is a single Bash script).
3. Check it: `bash -n gdm-wallpaper && shellcheck gdm-wallpaper`
4. Test it on a real machine (or VM) — set, undo, and reset.
5. Open a pull request describing what you changed and what you tested on.

## Guidelines

- Keep it a single, dependency-light Bash script.
- Never overwrite the `*.gdm-wallpaper-original` backup.
- Anything that touches system files must be reversible with `undo` or `reset`.
