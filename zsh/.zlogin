#! /bin/env zsh

# Compile the completion dump to increase startup speed.
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
fi

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {
    # Print a random, hopefully interesting, adage.
    if (( $+commands[fortune] )); then
        fortune -s
        print
    fi
} >&2
