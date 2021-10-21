#!/bin/zsh
# Very basic install script which symlinks a few dotfiles

ln -s "${PWD}/.zsh" ~/.zsh
ln -s "${PWD}/.zshrc" ~/.zshrc
ln -s "${PWD}/.zshenv" ~/.zshenv
ln -s "${PWD}/.dir_colors" ~/.dir_colors
