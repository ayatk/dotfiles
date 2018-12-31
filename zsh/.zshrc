#! /bin/env zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zoptions
if [[ -s "${ZDOTDIR:-$HOME}/.zoptions" ]]; then
    source "${ZDOTDIR:-$HOME}/.zoptions"
fi

# env settings
source "${ZDOTDIR:-$HOME}/env/$(uname).zsh"

# functions
for func (${ZDOTDIR:-$HOME}/functions/*) source $func:a

# zsh completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)

if (( $+commands[zprof] )); then
    zprof | less
fi
