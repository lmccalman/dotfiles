#!/bin/sh
while true; do
    find ~/Dropbox/images/wallpapers/UHD -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' \) -print0 |
        shuf -n1 -z | xargs -0 feh --bg-fill
    sleep 4h
done
