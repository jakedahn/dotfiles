#!/usr/bin/env bash

./install_scripts/install_base.sh
./install_scripts/janus.sh
./install_scripts/oh-my-zsh.sh
./install_scripts/fonts.sh
./install_scripts/gnome-terminal.sh

# install dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .gitignore ~/.gitignore
cp -r .zshrc ~/.zshrc
cp -r .oh-my-zsh ~/.oh-my-zsh
cp -r .vimrc.after ~/.vimrc.after
cp -r .vimrc ~/.vimrc
cp -r .vim ~/.vim

echo "Everything has been installed.\n"
echo "## NOTE: You should now run: chsh -s /bin/zsh"
