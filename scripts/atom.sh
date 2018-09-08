#!/usr/bin/env bash

TMPDIR="`mktemp -d`"
DEB_DEST="${TMPDIR}/atom.deb"
echo "Downloading deb to $DEB_DEST"
curl -L https://atom.io/download/deb -o $DEB_DEST
echo "Installing new deb"
sudo dpkg -i $DEB_DEST

