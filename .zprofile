source ~/.private
export QT_QPA_PLATFORMTHEME=qt5ct  

# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
if [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
  startx
fi
