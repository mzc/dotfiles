export TERM=xterm
export EDITOR='emacsclient -c -a ""'

export PATH="/sbin:/usr/sbin:${PATH}"

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/local/bin" ] ; then
    export PATH="${HOME}/local/bin:${PATH}"
fi
if [ -d "${HOME}/scripts" ]; then
    export PATH="${HOME}/scripts:${PATH}"
fi

# for cask
if [ -d "${HOME}/.cask/bin" ]; then
    export PATH="${HOME}/.cask/bin:${PATH}"
fi

# for rust
if [ -d "${HOME}/.cargo/bin" ]; then
    export PATH="${HOME}/.cargo/bin:${PATH}"
fi

# for go
if [ -d "${HOME}/go" ]; then
    export GOPATH="${HOME}/go:${HOME}/mygo"
    export PATH="${HOME}/go/bin:${PATH}"
fi

# include .bashrc if it exists
if [ -f "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi
