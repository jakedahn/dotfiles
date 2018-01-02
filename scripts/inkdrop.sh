#!/usr/bin/env bash

resp=`curl https://api.inkdrop.info/update/links`
base_url=`echo $resp | jq --raw-output .baseUrl`
deb_file=`echo $resp | jq --raw-output .files.linux.deb`
full_url="${base_url}/$deb_file"

wget $full_url -O /tmp/inkdrop.deb

sudo apt-get install -y libgconf2-4 # dependency
sudo dpkg -i /tmp/inkdrop.deb
