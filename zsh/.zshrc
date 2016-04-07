#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zoptions
if [[ -s "${ZDOTDIR:-$HOME}/.zoptions" ]]; then
  source "${ZDOTDIR:-$HOME}/.zoptions"
fi

# source zplug
if [[ -s "${ZDOTDIR:-$HOME}/.zplug" ]]; then
  source "${ZDOTDIR:-$HOME}/.zplug"
fi

# osx settings
if [[ -s "${ZDOTDIR:-$HOME}/osx" ]]; then
  source "${ZDOTDIR:-$HOME}/osx"
fi

# Customize to your needs...

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -uC

# hub alias
if (( $+commands[hub] )); then
  eval "$(hub alias -s)"
fi

# direnv
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

if [[ -s "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

if (which zprof > /dev/null) ;then
  zprof | less
fi
