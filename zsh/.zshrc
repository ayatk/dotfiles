#!/usr/bin/env zsh

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# zsh home directory
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

source "${ZDOTDIR:-$HOME}/zprofile"

# prezto の completion モジュールが compinit を実行するため、fpath はその前に追加する
# mise の brew マネージャは Homebrew 本体を入れないため、brew コマンドの有無ではなくディレクトリで判定する。
_brew_prefix=${HOMEBREW_PREFIX:-/opt/homebrew}
if [[ -d $_brew_prefix ]]; then
  fpath=(
    $_brew_prefix/share/{zsh-completions,zsh/site-functions}(N-/)
    $fpath
  )
fi
unset _brew_prefix
fpath=($HOME/.docker/completions(N-/) $fpath)

# zprezto
source "${ZDOTDIR}/zpreztorc"
source "${ZDOTDIR}/.zprezto/init.zsh"

# options
source "${ZDOTDIR}/options.zsh"

# envs
source "${ZDOTDIR}/env.zsh"

# functions
for func (${ZDOTDIR}/functions/*.zsh(N)) source $func

typeset -U path PATH
