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

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)


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
alias dl='youtube-dl'
alias a='atom'

alias todo='todoist --color'

# wttr.inのお天気情報を持ってくるalias
wttr() {
  curl wttr.in/${1}
}


# --------
# proxy
PROXY_SERVER='wwwproxy.kanazawa-it.ac.jp:8080'

if [ "`/usr/sbin/networksetup -getcurrentlocation`" = "kit" ]; then
    export http_proxy=http://$PROXY_SERVER/
    export https_proxy=https://$PROXY_SERVER/
    export ALL_PROXY=http://$PROXY_SERVER/
    git config -f $HOME/.gitconfig.proxy http.proxy $PROXY_SERVER
    git config -f $HOME/.gitconfig.proxy https.proxy $PROXY_SERVER
    git config -f $HOME/.gitconfig.proxy url."https://".insteadOf git://
else
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    : > $HOME/.gitconfig.proxy
fi


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
