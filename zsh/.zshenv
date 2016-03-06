#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# zmodload zsh/zprof && zprof

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export DOTDIR="$HOME/.dotfiles"
export ZDOTDIR="$DOTDIR/zsh/"

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
alias -g W='| wc'

alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

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

alias casku='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done && brew cask cleanup'
alias caskc='for c in /opt/homebrew-cask/Caskroom/*; do vl=(`ls -t $c`) && for v in "${vl[@]:1}"; do rm -rf "$c/$v"; done; done'
alias update='brewu && brewc && casku && caskc'

alias v='vagrant'

alias a='atom'

alias matlab="/Applications/MATLAB_R2016a.app/bin/matlab -nodisplay"

PROXY_SERVER='wwwproxy.kanazawa-it.ac.jp:8080'

NOW_LOCATION="/usr/sbin/scselect | grep "\s\*\s" | awk '{print $3}' | sed 's/[(|)]//g'"

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
if test "`${AIRPORT} -I | grep '[^B]SSID' | awk '{print $2}'`" = "KIT-WLAP" ; then
  export http_proxy=http://$PROXY_SERVER/
  export https_proxy=https://$PROXY_SERVER/
  export ALL_PROXY=http://$PROXY_SERVER/
  git config -f ~/.gitconfig.proxy http.proxy $PROXY_SERVER
  git config -f ~/.gitconfig.proxy https.proxy $PROXY_SERVER
  git config -f ~/.gitconfig.proxy url."https://".insteadOf git://
  /usr/sbin/scselect kit > /dev/null
else
  unset http_proxy
  unset https_proxy
  unset ALL_PROXY
  echo -n > ~/.gitconfig.proxy
  /usr/sbin/scselect home > /dev/null
fi

# wttr.inのお天気情報を持ってくるalias
wttr() {
  curl wttr.in/${1}
}
