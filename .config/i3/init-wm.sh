#!/bin/bash

# Terminate already running bar instances
killall -q polybar
dropbox &
dunst &

# workaround for redshift
# redshift-gtk & 
$HOME/.config/i3/wallpaper.sh &
nm-applet --sm-disable &
polybar mybar &
