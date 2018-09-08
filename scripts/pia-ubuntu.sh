#!/usr/bin/env bash

deb_path=`curl -L https://www.privateinternetaccess.com/installer/download_installer_linux  | pup 'meta[http-equiv="refresh"] attr{content}' | cut -c 8-`

cd /tmp
wget $deb_path -O /tmp/pia.tar.gz
tar -xzvf pia.tar.gz
./pia-*-installer-linux.sh

rm -rf ./pia.tar.gz
rm -rf ./pia-*-installer-linux.sh
