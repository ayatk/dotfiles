#!/usr/bin/env zsh

# ~/.zshenv で ZDOTDIR を決めた初回シェルでは $ZDOTDIR/.zshenv が読まれないため、未読なら読む
[[ -n $XDG_CONFIG_HOME ]] || source "${ZDOTDIR:-$HOME}/.zshenv"
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
if [[ -r "${ZDOTDIR}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR}/.zprezto/init.zsh"
else
  print -u2 "warning: ${ZDOTDIR}/.zprezto が未取得です（git submodule update --init --recursive）"
fi

# options
source "${ZDOTDIR}/options.zsh"

# envs
source "${ZDOTDIR}/env.zsh"

# functions
for func (${ZDOTDIR}/functions/*.zsh(N)) source $func

typeset -U path PATH
