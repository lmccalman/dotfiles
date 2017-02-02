export PACMAN=powerpill
export GOPATH=~/code/go
export PATH="$PATH:$GOPATH/bin"
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color
export ZSH=$HOME/.oh-my-zsh

#plugins=(vi-mode git git-flow-avh python zsh-syntax-highlighting history-substring-search)
plugins=(vi-mode git history-substring-search) 

ZSH_THEME="lb"
source $ZSH/oh-my-zsh.sh


export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=true
source /usr/bin/virtualenvwrapper.sh

#Aliases
alias shutdown="sudo shutdown -hP now"
alias aoeu='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias openports="netstat --all --numeric --programs --inet --inet6"
alias ison="ps -A | grep $1"
alias listfonts="fc-list | sed 's,:.*,,' | sort -u"
alias fontinfo="otfinfo -f"
# pacman/pacaur
alias pacall="LC_ALL=C pacman -Qi | sed -n '/^Name[^:]*: \(.*\)/{s//\1 /;x};/^Installed[^:]*: \(.*\)/{s//\1/;H;x;s/\n//;p}' | sort -nk2 | column -t"
alias pacupg='pacaur -Syu' # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='pacaur -S' # Install specific package(s) from the repositories
alias pacre='pacaur -R' # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='pacaur -Rns' # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacinf='pacaur -Si' # Display information about a given package in the repositories
alias pacs='pacaur -Ss' # Search for package(s) in the repositories
alias pacfiles='pacaur -Ql' # list the files from a certain pacagke
# steam
alias nvsteam=LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1' primusrun steam 
alias kubedocker='eval $(minikube docker-env)'
# docker
alias localdocker='eval $(minikube docker-env -u)'
alias csirovpn='sudo openconnect -u mcc542 --authgroup=CSIRO-LOCAL-LAN vpn.csiro.au'
# monitors
alias atdesk='xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP1-3 --off --output DP1-2 --mode 3840x2160 --pos 0x0 --rotate normal --output DP1-1 --off --output DP2 --off'
alias onthemove='xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP1-3 --off --output DP1-2 --off --output DP1-1 --off --output DP2 --off'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
