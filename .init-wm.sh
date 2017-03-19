#!/bin/bash

xrdb -merge -I$HOME ~/.Xresources
nm-applet --sm-disable &
unclutter -grab -noevents -root &
compton --config ~/.compton.conf &
$HOME/.dotfiles/bin/rotatingwallpaper &
enpass &

