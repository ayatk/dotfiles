#! /bin/env zsh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# zsh home directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/zprofile"
fi

# zprezto
source "${ZDOTDIR}/zpreztorc"
source "${ZDOTDIR}/.zprezto/init.zsh"

# options
source "${ZDOTDIR}/options.zsh"

# envs
source "${ZDOTDIR}/env.zsh"

# functions
for func (${ZDOTDIR}/functions/*) source $func:a
