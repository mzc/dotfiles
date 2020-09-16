#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# off beep if is in X session
if xhost >& /dev/null ; then
    xset b off
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [[ "${HOSTNAME}" =~ ^n ]]; then
    PS1="\e[0;33m[\u@\h \W]\$ \e[m"
else
    PS1="\e[0;31m[\u@\h \W]\$ \e[m"
fi

HISTTIMEFORMAT="%d/%m/%y %T "
