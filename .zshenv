########################################
# 環境変数
########################################
export LANG=ja_JP.UTF-8

########################################
# エイリアス
########################################

alias la='ls -lA'
alias ll='ls -l'
alias lsr='ls -lR'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# homebrew update and upgrade
alias brewup='brew update && brew upgrade && brew cleanup'
alias caskup='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done && brew cask cleanup'
alias update='brewup && caskup'

alias new='sh ~/.cmd/new.sh'

# switch network
alias home='networksetup -switchtolocation "home"'
alias kit='networksetup -switchtolocation "kit"'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

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

# "~hoge" が特定のパス名に展開されるようにする（ブックマークのようなもの）
# 例： cd ~hoge と入力すると /long/path/to/hogehoge ディレクトリに移動
hash -d go=~/.go
hash -d pro2=~/src/github.com/ayatk/pro2
hash -d github=~/src/github.com/
hash -d aoj=~/Documents/procon/aoj

alias casku='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done && brew cask cleanup'
alias update='brewu && casku'

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
if test "`${AIRPORT} -I | grep '[^B]SSID' | awk '{print $2}'`" = "KIT-WLAP"; then
    export http_proxy=http://wwwproxy.kanazawa-it.ac.jp:8080/
    export https_proxy=https://wwwproxy.kanazawa-it.ac.jp:8080/
    export ALL_PROXY=http://wwwproxy.kanazawa-it.ac.jp:8080/
    git config --global http.proxy proxy-server
    git config --global https.proxy proxy-server
    git config --global url."https://".insteadOf git://
    /usr/sbin/scselect KIT
else
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset url."https://".insteadOf
    /usr/sbin/scselect Home
fi

########################################
# Path
########################################

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Go-lang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/.go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
alias pset='source ~/.proxy/pset.bash'
PATH=$PATH:$HOME/.bin

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
PATH=${JAVA_HOME}/bin:${PATH}

# gvm
export PATH=$PATH:$HOME/.gvm/bin
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# docker host
export DOCKER_HOST=tcp://172.17.8.101:4243

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export ANDROID_NDK=/usr/local/Cellar/android-ndk/r10e