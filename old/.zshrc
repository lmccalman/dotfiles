# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lb/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export ZSH_AUTOSUGGEST_USE_ASYNC=1
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# eval "$(pipenv --completion)"
source /usr/bin/virtualenvwrapper.sh

eval "$(zoxide init zsh)"

bindkey '^[[Z' autosuggest-execute

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# System aliases
# alias find="fd"
# alias htop="btop"
# alias cat='bat'
alias ls='lsd'
alias tree='lsd --tree'
alias ag='rg'
alias du='dust'
alias shutdown="sudo shutdown -hP now"
alias aoeu='setxkbmap -layout us'
alias asdf='setxkbmap -layout us -variant dvorak'
alias openports="netstat --all --numeric --programs --inet --inet6"
alias ison="ps -A | grep $1"
alias listfonts="fc-list | sed 's,:.*,,' | sort -u"
alias fontinfo="otfinfo -f"
alias usbmic="zita-a2j -c 1 -j usbmic -d hw:ATGM1USB"
alias vidmic="zita-a2j -j vidmic -d hw:Webcam -r 32000"

# Git
alias gtree='git log --oneline --decorate --graph --all'

# paru
alias pacall='paru -Qq' # list all installed packages
alias pacexp='paru -Qqett' # explicitly installed packages
alias pacupg='paru -Syu --noconfirm' # sync and upgrade
alias pacin='paru -S' # install
alias pacrem='paru -Rns' # remove
alias pacinf='paru -Si' # show info
alias pacs='paru -Ss' # search
alias pacfiles='paru -Ql' # list the files from a certain pacagke
alias pacwhich='paru -Qo' # which package has that file
alias pacclean='paru -Qdtq | paru -Rs -' # kill unneeded pacs

# check wayland
alias iswayland='extramaus'

# Monitors
alias atdesk='~/.screenlayout/atdesk.sh'
alias onthemove='~/.screenlayout/onthemove.sh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzfx
alias fcd='cd "$(fzfx cd)"'

# UBP project
alias ubp='CLOUDSDK_COMPUTE_ZONE=$GCP_ZONE gcloud --project="ubp-fair"'
ubp-ssh() {
    gcloud compute ssh secure@${1:-devbox2-$USER} --zone=$GCP_ZONE --project="ubp-fair" --tunnel-through-iap -- -Y -C -L 8888:localhost:8888
}
ubp-upload() {
    gcloud compute scp $1 secure@${3:-devbox2-$USER}:$2 --zone=$GCP_ZONE --project="ubp-fair" --tunnel-through-iap --recurse
}
ubp-download() {
    gcloud compute scp secure@${3:-devbox2-$USER}:$1 ${2:-.} --zone=$GCP_ZONE --project="ubp-fair" --tunnel-through-iap --recurse
}
