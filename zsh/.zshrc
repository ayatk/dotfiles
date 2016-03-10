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
if[[ -x `type hub > /dev/null 2>&1`]]; then
  eval "$(hub alias -s)"
fi

# direnv
if[[ -x `type direnv > /dev/null 2>&1` ]]; then
  eval "$(direnv hook zsh)"
fi

if (which zprof > /dev/null) ;then
  zprof | less
fi
