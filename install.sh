#!/usr/bin/env bash

./scripts/install_base.sh
./scripts/janus.sh
./scripts/oh-my-zsh.sh
./scripts/fonts.sh
./scripts/gnome-terminal.sh

# install dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .gitignore ~/.gitignore
cp -r .zshrc ~/.zshrc
cp -r .vimrc.after ~/.vimrc.after
cp -r .vimrc ~/.vimrc
cp -r .vim ~/.vim

echo "Everything has been installed.\n"
echo "## NOTE: You should now run: chsh -s /bin/zsh"
