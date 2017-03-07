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
    # alias grep='--color=auto --exclude=tags --exclude=TAGS --exclude=*.min.js --exclude-dir=.git --exclude-dir=.hg'
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

# If we're using an xterm, force 256 colors.
case "$TERM" in
    xterm*) TERM=xterm-256color;;
esac

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1

# git prompt
#PS1='\w$(__git_ps1 " (%s)")\$ '

export NVM_DIR="/home/doubleface/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use stable

. <(npm completion)


# Only load liquidprompt in interactive shells, not from a script or from scp
echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt

