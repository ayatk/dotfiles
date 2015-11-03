#! /bin/sh
DIR=$(cd $(dirname $0); pwd)
# vim
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/vim ~/.vim

# git
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.gitattributes ~/.gitattributes
ln -s $DIR/.gitignore_global ~/.gitignore_global

# tmux
ln -s $DIR/tmux.conf ~/.tmux.conf

# zsh
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.zshenv ~/.zshenv

# bash
ln -s $DIR/.bash_profile ~/.bash_profile

# sh brewfile
## chsh -s /usr/local/bin/zsh
