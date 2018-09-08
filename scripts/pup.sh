#!/usr/bin/env bash

base_url="https://github.com"
deb_path=`curl -L https://github.com/EricChiang/pup/releases/latest | grep linux_amd64| awk -F '"' '{print $2}' | grep zip`
full_url="${base_url}${deb_path}"

cd /tmp
wget $full_url -O /tmp/pup.zip
unzip pup.zip
chmod a+x pup
sudo cp pup /usr/bin/pup

rm -rf pup.zip

