#!/usr/bin/env bash

mkdir -p ~/.janus

curl -Lo- https://bit.ly/janus-bootstrap | bash
git clone https://github.com/scrooloose/syntastic.git ~/.janus/syntastic || true
git clone https://github.com/Lokaltog/vim-powerline.git ~/.janus/vim-powerline || true
