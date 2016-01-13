### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

### Android
export ANDROID_HOME=/usr/local/opt/android-sdk

### Go-lang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

### brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

### added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
alias pset='source ~/.proxy/pset.bash'
PATH=$PATH:$HOME/.bin

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
PATH=${JAVA_HOME}/bin:${PATH}

# docker host
export DOCKER_HOST=tcp://172.17.8.101:4243
