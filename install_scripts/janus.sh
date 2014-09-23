#!/bin/bash

curl -Lo- https://bit.ly/janus-bootstrap | bash
mkdir -p ~/.janus
git clone https://github.com/scrooloose/syntastic.git ~/.janus/syntastic
git clone https://github.com/Lokaltog/vim-powerline.git ~/.janus/vim-powerline
