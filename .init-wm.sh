#!/bin/bash

xrdb -merge -I$HOME ~/.Xresources
unclutter -grab -noevents -root &
compton --config ~/.compton.conf &
$HOME/.dotfiles/bin/rotatingwallpaper &
enpass &

