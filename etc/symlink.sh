#! /bin/env bash

XDG_CONFIG_HOME=$HOME/.config

if [[ -f  $HOME/.zshrc ]]; then
    mv $HOME/.zshrc $HOME/.zshrc.$(date +'%Y%m%d%H%M%S').backup
fi 

ln -s $DOTPATH/zsh/.zshrc $HOME/.zshrc

link_dirs=(zsh vim git)

for dir in "${link_dirs[@]}"; do
    if [ -d "$XDG_CONFIG_HOME/$dir" ]; then
        mv $XDG_CONFIG_HOME/$dir $XDG_CONFIG_HOME/$dir.$(date +'%Y%m%d%H%M%S').backup
    fi
    ln -s $DOTPATH/$dir $XDG_CONFIG_HOME/$dir
done
