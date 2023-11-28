# Dotfiles
Some dotfiles for my linux system. Currently using Pop!\_OS.

- `zsh`: rc file and custom theme.
- minimal rc file for `vim`.
- rc file for `latexmk` (adding my custom directories too).
- [Nord](https://www.nordtheme.com/ports/dircolors) dircolors.
- Config files for `alacritty` terminal emulator, `albert` launcher, `neofetch` and `ranger`, along with my `autostart` settings.

## Setup
This repo contains submodules (just Doom Emacs for now, in fact), so you should clone it with the `--recurse-submodules` switch, e.g.:
```
git clone --recurse-submodules git@github.com:findlayjy/.dotfiles.git ~/.dotfiles
```
Once this is done, navigate to the directory you cloned the repo to, then run `./install.sh`, which will symlink the dotfiles into your `$HOME`, provided they're not already present (use the `-f` option to forcefully overwrite any existing versions of those files).
