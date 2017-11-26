### Basic ENVs {{{
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color
export TERMINAL=/usr/bin/termite
# }}}

### GO {{{
export GOPATH=~/code/go
export PATH="$PATH:$GOPATH/bin"
# }}}

### CUDA {{{
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/lib64"
export CUDA_HOME=/opt/cuda
# }}}

### Virtualenv {{{
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=true
source /usr/bin/virtualenvwrapper.sh
# }}}

### Oh-my-zsh {{{
export ZSH=$HOME/.oh-my-zsh
# dircycle: Ctrl+Shift+ Left/Right for moving around directory stack
# cp: provides cpv alias for rsync
# ctrl + space: execute suggestion
plugins=(cp dircycle dirpersist docker git git-flow-avh per-directory-history \
  history-substring-search kubectl zsh-autosuggestions) 
ZSH_THEME="lb"
source $ZSH/oh-my-zsh.sh
bindkey '^ ' autosuggest-execute
# }}}

### System aliases {{{
alias ag='rg'
alias shutdown="sudo shutdown -hP now"
alias aoeu='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias openports="netstat --all --numeric --programs --inet --inet6"
alias ison="ps -A | grep $1"
alias listfonts="fc-list | sed 's,:.*,,' | sort -u"
alias fontinfo="otfinfo -f"
# }}}

# Git {{{
alias gtree='git log --oneline --decorate --graph --all'
# }}}

# Pacaur {{{
alias pacall='pacaur -Qq' # list all installed packages
alias pacexp='pacaur -Qqett' # explicitly installed packages
alias pacupg='pacaur -Syu --noconfirm' # sync and upgrade
alias pacin='pacaur -S' # install
alias pacrem='pacaur -Rns' # remove
alias pacinf='pacaur -Si' # show info
alias pacs='pacaur -Ss' # search
alias pacfiles='pacaur -Ql' # list the files from a certain pacagke
alias pacwhich='pacaur -Qo' # which package has that file
alias pacclean='pacaur -Qdtq | pacaur -Rs -' # kill unneeded pacs
# }}}

### Steam {{{
alias nvsteam=LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1' optirun steam 
alias kubedocker='eval $(minikube docker-env)'
# }}}

### Docker {{{
alias localdocker='eval $(minikube docker-env -u)'
alias csirovpn='sudo openconnect -u mcc542 --authgroup=CSIRO-LOCAL-LAN vpn.csiro.au'
# }}}

### Monitors {{{
alias atdesk='xrandr --output eDP-1 --off --output DP-1-2 --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output DP-1-3 --off --output DP-2 --off --output DP-1-1 --off'
alias onthemove='xrandr --output eDP-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-1-2 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output DP-1-3 --off --output DP-2 --off --output DP-1-1 --off'
# }}}

### FZF {{{
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

### command-not-found {{{
source /usr/share/doc/pkgfile/command-not-found.zsh
# }}}


### Syntax highlighting {{{
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
