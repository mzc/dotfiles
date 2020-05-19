# if running bash
if [ -n "${BASH_VERSION}" ]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
	. "${HOME}/.bashrc"
    fi
fi

export TERM=xterm
export EDITOR='emacsclient -c -a ""'

PATH="/sbin:/usr/sbin:${PATH}"

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/local/bin" ] ; then
    PATH="${HOME}/local/bin:${PATH}"
fi

if [ -d "${HOME}/scripts" ]; then
    PATH="${HOME}/scripts:${PATH}"
fi

# for cask
export PATH="${HOME}/.cask/bin:${PATH}"

# for rust
export PATH="${HOME}/.cargo/bin:${PATH}"

# for go
export GOPATH="${HOME}/go:${HOME}/mygo"
export PATH="${HOME}/go/bin:${PATH}"

# for python pipenv
export PATH="${HOME}/.local/bin:${PATH}"

# off beep if is in X session
if xhost >& /dev/null ; then
    xset b off
fi

