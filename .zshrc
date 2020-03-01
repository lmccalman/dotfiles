### Basic ENVs {{{
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color
export TERMINAL=/usr/bin/alacritty
export DEFAULT_USER=lb
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
export PIPENV_VENV_IN_PROJECT=1
eval "$(pipenv --completion)"
source /usr/bin/virtualenvwrapper.sh
# }}}

### Oh-my-zsh {{{
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH=$HOME/.oh-my-zsh
# dircycle: Ctrl+Shift+ Left/Right for moving around directory stack
# cp: provides cpv alias for rsync
# shif + tab: execute suggestion
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
plugins=(cp dircycle dirpersist docker git git-flow-avh \
  history-substring-search kubectl zsh-autosuggestions vi-mode) 
# ZSH_THEME="lb"

function holyday() {
HOLYDAY=$(ddate +%H)
if [[ -n ${HOLYDAY} ]]; then
  echo "-${blue_op}${HOLYDAY}${blue_cp}"
fi
}

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="┌"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="└"
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
POWERLEVEL9K_CUSTOM_DDATE="ddate +%H"
POWERLEVEL9K_CUSTOM_DDATE_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_DDATE_FOREGROUND="yellow"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_OS_ICON_BACKGROUND="015"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="blue"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="blue"
POWERLEVEL9K_VI_MODE_VISUAL_FOREGROUND="black"
POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND="blue"
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_COMMAND_MODE_STRING=""
POWERLEVEL9K_STATUS_OK_BACKGROUND='015'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='015'
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context vcs custom_ddate virtualenv vi_mode newline background_jobs os_icon)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(dir status command_execution_time)
ZSH_THEME="powerlevel9k/powerlevel9k"
source $ZSH/oh-my-zsh.sh
bindkey '^[[Z' autosuggest-execute
# }}}

### termite {{{
# allow the "open in current dir" command to work
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi
# }}}


### System aliases {{{
alias ls='lsd'
alias ag='rg'
alias shutdown="sudo shutdown -hP now"
alias aoeu='setxkbmap -layout us'
alias asdf='setxkbmap -layout us -variant dvorak'
alias openports="netstat --all --numeric --programs --inet --inet6"
alias ison="ps -A | grep $1"
alias listfonts="fc-list | sed 's,:.*,,' | sort -u"
alias fontinfo="otfinfo -f"
alias usbmic="zita-a2j -c 1 -j usbmic -d hw:ATGM1USB"
alias vidmic="zita-a2j -j vidmic -d hw:Webcam -r 32000"
# }}}

# Git {{{
alias gtree='git log --oneline --decorate --graph --all'
# }}}

# yay {{{
alias pacall='yay -Qq' # list all installed packages
alias pacexp='yay -Qqett' # explicitly installed packages
alias pacupg='yay -Syu --noconfirm' # sync and upgrade
alias pacin='yay -S' # install
alias pacrem='yay -Rns' # remove
alias pacinf='yay -Si' # show info
alias pacs='yay -Ss' # search
alias pacfiles='yay -Ql' # list the files from a certain pacagke
alias pacwhich='yay -Qo' # which package has that file
alias pacclean='yay -Qdtq | yay -Rs -' # kill unneeded pacs
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
alias hs="cut -d';' -f2  ~/.zsh_history | fzf"
# }}}

### command-not-found {{{
# pacin pkgfile
# source /usr/share/doc/pkgfile/command-not-found.zsh
# }}}

### Syntax highlighting {{{
# pacin zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# }}}
