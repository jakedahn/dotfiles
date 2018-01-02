#!/usr/bin/env bash

CWD=$(cd $(dirname $0) && pwd)

mkdir -p ~/.local/share/fonts
cp -r $CWD/../vendor/fonts/* ~/.local/share/fonts
