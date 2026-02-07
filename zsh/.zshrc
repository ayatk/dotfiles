#!/usr/bin/env zsh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# zsh home directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

source "${ZDOTDIR:-$HOME}/zprofile"

# zprezto
source "${ZDOTDIR}/zpreztorc"
source "${ZDOTDIR}/.zprezto/init.zsh"

# options
source "${ZDOTDIR}/options.zsh"

# envs
source "${ZDOTDIR}/env.zsh"

# functions
for func (${ZDOTDIR}/functions/*.zsh(N)) source $func

# compinit with cache optimization
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

typeset -U path PATH
