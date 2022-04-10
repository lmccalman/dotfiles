#!/bin/bash
while true; do
  IMAGE=`fd -I \[.jpg\|.jpeg\|.png\] ~/Dropbox/images/wallpapers/UHD | shuf -n1`
  killall swaybg || true
  swaybg -i ${IMAGE} -m fill &
  sleep 4h
done
