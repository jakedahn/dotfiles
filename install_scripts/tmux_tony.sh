#!/bin/bash

git clone https://github.com/tony/tmux-config.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
cd ~/.tmux
git submodule init
git submodule update
cd ~/.tmux/vendor/tmux-mem-cpu-load
cmake .
make
sudo make install

sudo pip install psutil
sudo cp ~/.tmux/vendor/basic-cpu-and-memory.tmux /usr/local/bin/tmux-mem-cpu-load
sudo chmod +x /usr/local/bin/tmux-mem-cpu-load
