# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

HIST_STAMPS="dd.mm.yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
alias tcf="termux-camera-photo"
alias aptup="apt update && apt list --upgradable"
alias aptli="apt list | grep -v installed | grep -v dev"
alias vrc="vim ~/.vimrc"
alias viw='vim ~/vimwiki/index.wiki'
alias zrc='vim ~/.zshrc'
alias dia='vim ~/vimwiki/PersonalLog.wiki'
alias ba='buku -a'
alias yd='youtube-dl'
alias updyd='pip install youtube-dl -U'
alias pip='pip3.6'

export USER=$(whoami)
export doc=/storage/sdcard0/documents/
export PATH=$PATH:/data/data/com.termux/files/home/scr
