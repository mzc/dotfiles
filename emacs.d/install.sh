#!/bin/bash

if [[ ! -e ~/.cask ]]; then
    echo "Cloning Cask repo"
    git clone git@github.com:cask/cask.git ~/.cask
fi

if [[ ! -e ~/local/bin/cask ]]; then
    ln -s ~/.cask/bin/cask ~/local/bin
fi

cd ~/.emacs.d
cask install
