#! /bin/env zsh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# zsh home directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# history
mkdir -p $XDG_DATA_HOME/zsh
export HISTFILE=$XDG_STATE_HOME/zsh_history

if [[ -s "${ZDOTDIR}/init.zsh" ]]; then
  source "${ZDOTDIR}/init.zsh"
fi
