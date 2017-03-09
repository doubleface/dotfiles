# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoreboth # ignore same sucessive entries.
export HISTFILESIZE=3000 # the bash history should save 3000 commands
shopt -s checkwinsize
shopt -s histappend

# files inclusion
. ~/.bash_perso

PROMPT_DIRTRIM=2

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto --exclude=tags --exclude=TAGS --exclude=*.min.js --exclude-dir=.git --exclude-dir=.hg'
fi

export EDITOR="vim"
export PAGER="less"

alias l='ls -CF'
alias ll="ls -Flh --group-directories-first"
alias lll="ls -lRh"
alias la="ls -A"
alias lla="ll -A"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

shopt -s histverify
shopt -s globstar

# If we're using an xterm, force 256 colors.
case "$TERM" in
    xterm*) TERM=xterm-256color;;
esac
