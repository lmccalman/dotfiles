export EDITOR=/usr/bin/nvim
export TERM=xterm-256color
export TERMINAL=/usr/bin/alacritty
export DEFAULT_USER=lb
export BROWSER=/usr/bin/firefox-developer-edition
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway

# python
export POETRY_VIRTUALENVS_IN_PROJECT=1

# X / Wayland
export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_FORCE_DPI=physical
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GTK_THEME=Breeze:dark
# export GTK_USE_PORTAL=1 breaking file dialogs?
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
export SDL_VIDEODRIVER="wayland,x11"
