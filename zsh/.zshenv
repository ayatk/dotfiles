#! /bin/env zsh

# zmodload zsh/zprof && zprof

export DOTDIR="$HOME/.dotfiles"
export ZDOTDIR="$DOTDIR/zsh"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    $path
)
