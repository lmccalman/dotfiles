source ~/.private
export QT_QPA_PLATFORMTHEME=qt5ct  
export CARGO_MSG_LIMIT=1

# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
if [[ ! $DISPLAY && "$(tty)" = "/dev/tty1" ]]; then
  startx
fi
