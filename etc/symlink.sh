#! /bin/env bash

XDG_CONFIG_HOME=$HOME/.config

if [[ ! -f  $HOME/.zshrc ]]; then
    ln -s $DOTPATH/zsh/.zshrc $HOME/.zshrc
fi 

link_dirs=(zsh vim git)

for dir in link_dirs; do
    if [ ! -d "$DOTPATH" ]; then
        ln -s $DOTPATH/$dir $XDG_CONFIG_HOME/$dir
    fi
done
