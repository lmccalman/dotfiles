# dotfiles
Current dotfiles on my linux machines

I use breeze.
configure for kde-based everything, with qt5ct and lxappearance of kde system
Font for desktop is cantarell.
Breeze snow cursor theme from KDE

clight with geoclue2 for brightness of screen

For infinality-ish font rendering:
https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671


look at aconfmgr for arch configuration management

for shell scripts see the following python packages:
plumbum
sarge
sh
pyp (awk/sed replacement)

https://github.com/jarun/imgp

For making new SSH keys:

  ssh-keygen -t ed25519


yay --sudoloop
yay --answeredit None
yay --answerclean NotInstalled

## commands I often forget
use pdftk for pdf joining etc

## audio
passwd --add lb realtime
cpupower frequency-set -g performance

Alternatively try running at 1024 fpp. If there are still occasional, periodic x-runs, this hints at system-management IRQs (health checks: power/voltage, temperature, etc) and will be very hard to get rid of. If you have the option, disable some power-saving options in the BIOS, particularly pci-bus frequency scaling, EIST, and C1E halt-states.
look at rtirq


## Non-free fonts
ttf-ms-win10

## Fonts
fonts-meta-base
ttf-google-fonts-typewolf
fonts-meta-extended-lt ## includes infinality subs
xorg-fonts-misc
go-fonts-git
otf-font-awesome
ttf-roboto
adobe-source-code-pro-fonts
adobe-source-han-sans-jp-fonts
otf-ipafont

## My Packages
firefox-trydactyl-native
pactl
xss-lock
neovim
python-neovim
python-jedi
python-pipenv
i3
alacritty
rofi
xclip
xorg-server
xorg-apps
go
yay
ddate
jre10-openjdk-headless
xorg-apps
unclutter-xfixes-git
compton
conky
pkgfile
dropbox
gufw
ufw-extras
xdg-utils?
redshift
feh
vlc
texlive-most
dunst
lxappearance-gtk3
gnome-themes-extra
adwaita-qt4
adwaita-qt5
breeze-snow-cursor-theme
unzip
lm_sensors
spotify
alsa-utils
nemo
nemo-preview
nemo-dropbox
jack2-dbus
cadence
ladish
pulseaudio-alsa
pulseaudio-jack
bitwig-studio
ttf-roboto
vdpauinfo
texlive-most
texlive-most
lilypond
fluidsynth
soundfont-fluid
openvpn
transmission-gtk
network-manager
network-manager-applet
dhclient
ntfs-3g
darktable
musescore
gwenview
mozc
fcitx
fcitx-mozc
fcitx-configtool
fcitx-gtk2
fcitx-gtk3
fcitx-qt4
fcitx-qt5
fctix-ui-light
meld
k3b (cd ripping)
fslint
digikam?
gpick
invada-studio-plugins-lv2
calf
artyfx
cpupower
realtime-privliges
ardour
linvst
wine
ripgrep
google-cloud-sdk
docker

# Laptop only
networkmanager
networkmanager-applet
blueman-applet
