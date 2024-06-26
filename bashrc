# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Import bashrc containing Google-specific bash config.
# source $HOME/.google_bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


alias cowsay=/usr/games/cowsay
export GOROOT=/usr/lib/google-golang
set -o pipefail

# Process Shortcuts
alias chromium='(chromium-browser & &> /tmp/chromium_output); exit'
alias chrome='(google-chrome & &> /tmp/chrome_output); exit'
alias spotify='(spotify & &> /tmp/spotify_output_output); exit'
alias i='sudo apt-get install'

# Text Editor
EDITOR='vim'
alias v='vim'

# Keyboard
## Swap Escape and CapsLock
# Some combination of my keyboarda and the VScode Vim extension does not
# like any commandline key rebinding. I found that setting first setting
# extension.vim_escape to the CapsLock key. Then using gnome-tweaks to
# set capslock to an additional escape key worked across both the terminal
# and VScode.

# List Dir
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Parses a timestamp to human-readable output
function datets(){
  date +%Y%m%d --date @"$1"
}

# Set amixer playback value
function playback(){
  amixer sset Master playback "$1" unmute
  amixer sset Headphone playback "$1" unmute
}
# Mute Sound
alias m='amixer sset Master toggle'

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"


# Terminal Colors ==============================================================
# Using Dracula terminal color scheme here: https://draculatheme.com/gnome-terminal
# Solarize Dir Colors
eval `dircolors /home/megalodon/.dir_colors/dircolors`

# Command prompt colors
# Colors
black="\[$(tput setaf 0)\]"
red="\[$(tput setaf 1)\]"
green="\[$(tput setaf 2)\]"
yellow="\[$(tput setaf 3)\]"
blue="\[$(tput setaf 4)\]"
magenta="\[$(tput setaf 5)\]"
cyan="\[$(tput setaf 6)\]"
white="\[$(tput setaf 7)\]"

# Title bar - "user@host: ~"
title="\u@\h: \w"
titlebar="\[\033]0;"$title"\007\]"

# Git branch
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\ /';
}

# Clear attributes
clear_attributes="\[$(tput sgr0)\]"

# Custom bash prompt - "➜  ~ (master) "
export PS1="${titlebar}${green}➜  ${blue}\w ${cyan}\$(git_branch)${white}\$ ${clear_attributes}"
# =============================================================================


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/megalodon/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/megalodon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/megalodon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/megalodon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

