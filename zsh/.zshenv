#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# zmodload zsh/zprof && zprof


export DOTDIR="$HOME/.dotfiles"
export ZDOTDIR="$DOTDIR/zsh"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

########################################
# エイリアス
########################################

# suffix alias
alias -s txt='cat'
alias -s rb='ruby'
alias -s py='python'

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'

alias v='vagrant'

alias a='atom'

# --------
# proxy
PROXY_SERVER='wwwproxy.kanazawa-it.ac.jp:8080'

if [[ $(uname) -eq 'Darwin' ]]; then
  NOW_LOCATION="/usr/sbin/scselect | grep "\s\*\s" | awk '{print $3}' | sed 's/[(|)]//g'"
  AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  if [[ `${AIRPORT} -I | grep '[^B]SSID' | awk '{print $2}'` = "KIT-WLAP" ]] ; then
    export http_proxy=http://$PROXY_SERVER/
    export https_proxy=https://$PROXY_SERVER/
    export ALL_PROXY=http://$PROXY_SERVER/
    git config -f $HOME/.gitconfig.proxy http.proxy $PROXY_SERVER
    git config -f $HOME/.gitconfig.proxy https.proxy $PROXY_SERVER
    git config -f $HOME/.gitconfig.proxy url."https://".insteadOf git://
    /usr/sbin/scselect kit > /dev/null
  else
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    echo -n > $HOME/.gitconfig.proxy
    /usr/sbin/scselect home > /dev/null
  fi
fi
# wttr.inのお天気情報を持ってくるalias
wttr() {
  curl wttr.in/${1}
}
