#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [[ "${HOSTNAME}" =~ ^n ]]; then
    PS1="\e[0;33m[\u@\h \W]\$ \e[m"
else
    PS1="\e[0;31m[\u@\h \W]\$ \e[m"
fi

HISTTIMEFORMAT="%d/%m/%y %T "
