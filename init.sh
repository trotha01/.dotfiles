#!/usr/bin/env bash

# Get the dirname of this script
DIR="$(dirname "${BASH_SOURCE}")";

# BASHRC / BASH_PROFILE
if [ -e $HOME/.bash_profile ]; then
    echo "source $DIR/bash/bashrc" >> $HOME/.bash_profile
elif [ -e $HOME/.bashrc ]; then
    echo "source $DIR/bash/bashrc" >> $HOME/.bashrc
else
    ln -s $DIR/bash/bashrc $HOME/.bash_profile
    ln -s $DIR/bash/bashrc $HOME/.bashrc
fi

# VIMRC
if [ ! -e $HOME/.vimrc ]; then
    ln -s $DIR/vim/vimrc $HOME/.vimrc
fi

