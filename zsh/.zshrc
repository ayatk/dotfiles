#! /bin/env zsh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh home directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# history
export HISTFILE=$XDG_DATA_HOME/zsh/history

if [[ -s "${ZDOTDIR}/init.zsh" ]]; then
    source "${ZDOTDIR}/init.zsh"
fi
