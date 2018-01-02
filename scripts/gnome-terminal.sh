#!/usr/bin/env bash

cat <<EOT > /tmp/gnome-terminal.dconf
[/]
foreground-color='#c0c5ce'
rewrap-on-resize=true
visible-name='Base 16 Ocean Dark'
palette=['#2b303b', '#bf616a', '#a3be8c', '#ebcb8b', '#8fa1b3', '#b48ead', '#96b5b4', '#c0c5ce', '#65737e', '#bf616a', '#a3be8c', '#ebcb8b', '#8fa1b3', '#b48ead', '#96b5b4', '#eff1f5']
use-system-font=false
use-theme-colors=false
font='Source Code Pro for Powerline Light 12'
use-theme-transparency=false
allow-bold=true
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#c0c5ce'
background-color='#2b303b'
scrollback-lines=50000
EOT

# Get the gnome terminal default profile id
profile_id="$(gsettings get org.gnome.Terminal.ProfilesList default)"
profile_id="${profile_id:1:-1}" # strips single quotes from uuid

dconf load /org/gnome/terminal/legacy/profiles:/:$profile_id/ < /tmp/gnome-terminal.dconf
