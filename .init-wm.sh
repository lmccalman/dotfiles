#!/bin/bash

xrdb -merge -I$HOME ~/.Xresources
unclutter -grab -noevents -root &
$HOME/.dotfiles/bin/rotatingwallpaper &

