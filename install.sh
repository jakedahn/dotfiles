#!/usr/bin/env bash

./install_scripts/install_deps.sh
./install_scripts/janus.sh
./install_scripts/tmux_tony.sh
./install_scripts/oh-my-zsh.sh

# install dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .gitignore ~/.gitignore
cp -r .zshrc ~/.zshrc
cp -r .oh-my-zsh ~/.oh-my-zsh
cp -r .screenrc ~/.screenrc
cp -r .vimrc.after ~/.vimrc.after
cp -r .vimrc ~/.vimrc
cp -r .vim ~/.vim
cp -r .janus ~/.janus

echo "Everything has been installed.\n"
echo "## NOTE: You should now run: chsh -s /bin/zsh"
