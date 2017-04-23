#!/bin/bash
xrdb -merge -I$HOME ~/.Xresources
xsetroot -cursor_name left_ptr
unclutter -grab -noevents -root &
compton --config ~/.compton.conf &
$HOME/.config/i3/wallpaper.sh &
enpass &

