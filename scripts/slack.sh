#!/usr/bin/env bash

wget https://packagecloud.io/slacktechnologies/slack/gpgkey -O - | apt-key add -
echo deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main | sudo tee /etc/apt/sources.list.d/slacktechnologies_slack.list
sudo apt-get update
sudo apt-get install slack-desktop
