# bin files
export DOTPATH=${DOTPATH:-$HOME/.dotfiles}
PATH="${PATH:+${PATH}:}$DOTPATH/bin"

# ghq
export GOPATH=$HOME
export GHQ_ROOT=$GOPATH/src
