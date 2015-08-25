### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

### pyenv
export PYENV_ROOT=/usr/local/opt/pyenv

### Android
export ANDROID_HOME=$HOME/Library/Android/sdk

### Go-lang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/.go
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

### brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

### added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
alias pset='source ~/.proxy/pset.bash'
PATH=$PATH:$HOME/.bin

### pyenv
PYENV_ROOT=/usr/local/var/pyenv

if [ -d "${PYENV_ROOT}" ]; then
	export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi# enhancd

if [ -f "$HOME/.enhancd/zsh/enhancd.zsh" ]; then
    source "$HOME/.enhancd/zsh/enhancd.zsh"
fi

### mysql
export PATH=$PATH:/usr/local/mysql/bin

### java
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_72.jdk/Contents/Home'
PATH=${JAVA_HOME}/bin:${PATH}

### gvm
export PATH=$PATH:$HOME/.gvm/bin
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export DOCKER_HOST=tcp://172.17.8.101:4243