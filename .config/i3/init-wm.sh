#!/bin/bash

xrdb -merge -I$HOME ~/.Xresources
unclutter -grab -noevents -root &
compton --config ~/.compton.conf &
$HOME/.config/i3/wallpaper.sh &
xfce4-power-manager &
enpass &

