#!/bin/zsh
# Basic install script which symlinks some dotfiles if they're not already present. Use -f option to force it to overwrite the files if they already exist.

# Lists of dotfiles
home_dotfiles=(.zsh .zshrc .zshenv .dir_colors .vimrc .uio .latexmkrc)
config_dotfiles=(alacritty albert autostart neofetch ranger)


# Symlink dotfile to home directory if not already present there
install_dotfile(){
[ -e ~/$1 ] || ln -s "${PWD}/$1" ~/$1
}

# Symlink dotfile to home directory even if present, overwriting existing file
force_install_dotfile(){
rm -rf ~/$1
ln -s "${PWD}/$1" ~/$1
}

while getopts ":f" option; do
    case $option in 
        f) # Overwrite existing files by removing them first
           for file in $home_dotfiles[@]; do
               force_install_dotfile $file
           done
           for file in $config_dotfiles[@]; do
                force_install_dotfile .config/$file
           done
           exit;;
    esac
done

for file in $home_dotfiles[@]; do
    install_dotfile $file
done

for file in $config_dotfiles[@]; do
    install_dotfile .config/$file
done
