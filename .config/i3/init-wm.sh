#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch Polybar, using default config location ~/.config/polybar/config
polybar mybar &

dropbox &
dunst &
redshift &
$HOME/.config/i3/wallpaper.sh &
nm-applet --sm-disable &

