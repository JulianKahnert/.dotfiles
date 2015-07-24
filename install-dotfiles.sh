#!/bin/bash

# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"
DOTDIR=$(pwd)

# Update all submodules 
git submodule init && git submodule update

# Create symlinks into the home dir to enable usage of the files
ln -s $DOTDIR/.oh-my-zsh $HOM
ln -s $DOTDIR/.zshrc     $HOME
ln -s $DOTDIR/.zsh       $HOME
ln -s $DOTDIR/.vim       $HOME
ln -s $DOTDIR/.vimrc     $HOME

cd .awesome-terminal-fonts
./install.sh
