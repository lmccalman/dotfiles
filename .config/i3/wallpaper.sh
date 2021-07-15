#!/bin/sh
while true; do
  IMAGES=`find ~/store/Dropbox/images/wallpapers/UHD -type f \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' \) | shuf -n2`
  IMAGE1=`echo ${IMAGES} | sed -n 1p`
  IMAGE2=`echo ${IMAGES} | sed -n 2p`
  feh --bg-fill ${IMAGE1} --bg-fill ${IMAGE2}
  sleep 4h
done
