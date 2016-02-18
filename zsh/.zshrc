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
# Customize to your needs...

# enhancd
source ~/.dotfiles/Enhancd/enhancd.sh

# favdir
source ~/.dotfiles/Favdir/favdir.sh

# zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -uC

# hub alias
eval "$(hub alias -s)"

# direnv
eval "$(direnv hook zsh)"

if (which zprof > /dev/null) ;then
  zprof | less
fi
