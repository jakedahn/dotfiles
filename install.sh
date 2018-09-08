#!/usr/bin/env bash

set -e

# We want to setup the apt mirrors first.

./scripts/install_base.sh
./scripts/janus.sh
./scripts/oh-my-zsh.sh
./scripts/fonts.sh
./scripts/gnome-terminal.sh
./scripts/chrome.sh
./scripts/inkdrop.sh

# install dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .gitignore ~/.gitignore
cp -r .zshrc ~/.zshrc
cp -r .vimrc.after ~/.vimrc.after

echo "Everything has been installed.\n"
echo "## NOTE: You should now run: chsh -s /bin/zsh"
