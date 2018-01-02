#!/usr/bin/env bash

base_url="https://github.com"
deb_path=`curl -L https://github.com/Enrico204/Whatsapp-Desktop/releases/latest | grep amd64.deb | awk -F '"' '{print $2}' | grep .deb`
full_url="${base_url}${deb_path}"
wget $full_url -O /tmp/whatsapp.deb

sudo dpkg -i /tmp/whatsapp.deb
