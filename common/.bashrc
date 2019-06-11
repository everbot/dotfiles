# https://github.com/everbot/dotfiles
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|tmux*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

source ~/.profile


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PROMPT_HOSTNAME=''
PROMPT_COLOR='1;37m'
PROMPT_COLOR2='1;32m'
USER_NAME='ltt'

# the old PROMPT...
# PS1='\[\e]1;${PROMPT_HOSTNAME}\a\e]2;${PROMPT_HOSTNAME}:\w\a\
# \e[${PROMPT_COLOR}\]\
# <${USER_NAME}@${PROMPT_HOSTNAME}:${PWD}>\n \#♡ \
# \[\e[m\]'




#the new PROMPT original
# PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then
# echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h';
# fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\076 \[\033[0m\]"




#new PROMPT...
PS1="\[\e]1;${PROMPT_HOSTNAME}\a\e]2;${PROMPT_HOSTNAME}:\w\a\]\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then
# ${USER_NAME}\[\033[0;37m\]@\[\033[0;96m\]${PROMPT_HOSTNAME} <- username@hotstname
echo '\[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; else echo '\[\033[0;33m\]${USER_NAME}\[\033[0;37m\]\[\033[0;96m\]${PROMPT_HOSTNAME}';
# \342\224\200 : 1 dash
# printint second line
# fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]${PWD}\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\076 \[\033[0m\]\#\$ <- need a double quote at the end here
fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\076 \[\033[0m\]\#\$ "


#for matlab
#export AWT_TOOLKIT=MToolkit

# only allow 1 gvim instance:
# gvim () { command gvim --remote-silent "$@" || command gvim "$@"; }


# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
pathAdd $HOME/.rvm/bin


# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
