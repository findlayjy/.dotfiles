# Dotfiles
Some config for my Linux system. Currently using Pop!\_OS.

- Home directory files:
    - `.zsh`: contains prompt themes and [antigen](https://github.com/zsh-users/antigen) package manager.
    - `.dir_colors`: [Nord](https://www.nordtheme.com/ports/dircolors) dircolors.
    - `.latexmkrc`: configuration for [latexmk](https://www.cantab.net/users/johncollins/latexmk/)
    - `.vimrc`: minimal config file for [Vim](https://www.vim.org/) (though I mostly use [Emacs](https://www.gnu.org/software/emacs/), and am experimenting with [Neovim](https://neovim.io/)).
    - `.zshenv`: setting environment variables for [Zsh](https://www.zsh.org/) sessions.
    - `.zshrc`: config for Zsh
    - `.condarc`: config file for [Conda](https://docs.conda.io/en/latest/).
- Config files for
    - `alacritty`: config for [Alacritty](https://github.com/alacritty/alacritty) terminal emulator
    - `albert`: config for the [Albert launcher](https://github.com/albertlauncher/albert)
    - `autostart`: Programs to run on startup
    - `doom`: [(Doom) Emacs](https://github.com/doomemacs/doomemacs) personal config (see there for more info)
    - `neofetch`: [Neofetch](https://github.com/dylanaraps/neofetch) config
    - `nvim`: a (for the moment) minimal [Nvim](https://neovim.io/) config
    - `ranger`: config for the [Ranger](https://github.com/ranger/ranger) file manager (not actively using this)

## Setup
This repo contains submodules (just Doom Emacs for now, in fact), so you should clone it with the `--recurse-submodules` switch, e.g.:
```
git clone --recurse-submodules git@github.com:findlayjy/.dotfiles.git ~/.dotfiles
```
Once this is done, navigate to the directory you cloned the repo to, then run `./install.sh`, which will symlink the dotfiles into your `$HOME`, provided they're not already present (use the `-f` option to forcefully overwrite any existing versions of those files).
