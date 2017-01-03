#!/bin/bash

xrdb -merge -I$HOME ~/.Xresources
nm-applet &
unclutter -grab -noevents -root &
$HOME/.dotfiles/bin/rotatingwallpaper &

