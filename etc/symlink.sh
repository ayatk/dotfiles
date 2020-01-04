#! /bin/env bash

XDG_CONFIG_HOME=$HOME/.config

# files
dot_files=(
    ["zshrc"]="zsh/.zshrc" \
    ["gitconfig"]="git/gitconfig" \
    ["vimrc"]="vim/vimrc" \
)
for file in "${!dot_files[@]}"; do
    if [[ -f  $HOME/$file ]]; then
        mv $HOME/$file $HOME/.$file.$(date +'%Y%m%d%H%M%S').backup
    fi 

    ln -s $DOTPATH/${dot_files[$file]} $HOME/.$file
done

# directories
link_dirs=(zsh vim git)
for dir in "${link_dirs[@]}"; do
    if [ -d "$XDG_CONFIG_HOME/$dir" ]; then
        mv $XDG_CONFIG_HOME/$dir $XDG_CONFIG_HOME/$dir.$(date +'%Y%m%d%H%M%S').backup
    fi
    ln -s $DOTPATH/$dir $XDG_CONFIG_HOME/$dir
done
