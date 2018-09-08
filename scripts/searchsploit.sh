#!/bin/bash

sudo git clone https://github.com/offensive-security/exploit-database.git /opt/exploitdb
sudo chown -R quietsec:quietsec /opt/exploitdb
cd /opt/exploitdb
git pull origin master
sudo ln -s /opt/exploitdb/exploitdb /usr/bin/exploitdb
