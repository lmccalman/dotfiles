#!/bin/bash
while true; do
  IMAGE=`fd \[.jpg\|.jpeg\|.png\] ~/Dropbox/images/wallpapers/UHD | shuf -n1`
  # feh --bg-fill ${IMAGE1} --bg-fill ${IMAGE2}
  echo ${IMAGE}
  killall swaybg
  swaybg -i ${IMAGE} -m fill &
  sleep 4h
done
