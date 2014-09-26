#!/bin/bash

##############################################################################
# Mac OS
##############################################################################

if [ ! -f /etc/lsb-release ]; then
    command -v brew >/dev/null 2>&1 || {
        echo "You need to install homebrew before running this." >&2; exit 1;
    }
    brew install git wget zsh mercurial sqlite tmux nmap
fi

##############################################################################
# Ubuntu
##############################################################################

if [ -f /etc/lsb-release ]; then
    sudo chmod 777 /usr/bin/chsh

    sudo apt-get update
    sudo apt-get install -y ruby2.0 git zsh mercurial sqlite tmux nmap \
                            build-essential htop mosh curl wget

fi