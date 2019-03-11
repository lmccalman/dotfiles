#!/bin/bash

# Terminate already running bar instances
killall -q polybar
dropbox &
dunst &

# workaround for redshift
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
redshift-gtk & 
$HOME/.config/i3/wallpaper.sh &
nm-applet --sm-disable &
polybar mybar &
