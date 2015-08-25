#! /bin/sh
DIR=$(cd $(dirname $0); pwd)
ln -s $DIR/vim/vimrc ~/.vimrc
ln -s $DIR/git/gitconfig ~/.gitconfig
ln -s $DIR/git/gitattributes ~/.gitattributes
ln -s $DIR/git/gitignore_global ~/.gitignore_global

ln -s $DIR/tmux/tmux.conf ~/.tmux.conf
ln -s $DIR/zsh/zshrc ~/.zshrc
ln -s $DIR/vim ~/.vim
ln -s $DIR/bash_profile ~/.bash_profile

# sh brewfile
## chsh -s /usr/local/bin/zsh
