#!/usr/bin/env bash

# update and install base packages
sudo apt-get update
sudo apt-get install ruby1.9.3 rake git zsh -y

# install oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install janus
curl -Lo- https://bit.ly/janus-bootstrap | bash
mkdir -p ~/.janus
git clone https://github.com/scrooloose/syntastic.git ~/.janus/syntastic
git clone https://github.com/Lokaltog/vim-powerline.git ~/.janus/vim-powerline

# install dotfiles
cp -r .gitconfig ~/.gitconfig
cp -r .gitignore ~/.gitignore
cp -r .git ~/.git
cp -r .zshrc ~/.zshrc
cp -r .oh-my-zsh ~/.oh-my-zsh
cp -r .screenrc ~/.screenrc
cp -r .vimrc.after ~/.vimrc.after
cp -r .vimrc ~/.vimrc
cp -r .vim ~/.vim
cp -r .janus ~/.janus


# echo at end
echo "Everything has been installed.\n"
echo "## NOTE: You should now run: chsh -s /bin/zsh"
