#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG=ja_JP.UTF-8
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Android NDK
export ANDROID_NDK=/usr/local/Cellar/android-ndk/r10e

# Golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
PATH=${JAVA_HOME}/bin:${PATH}

# docker host
export DOCKER_HOST=tcp://172.17.8.101:4243


# dart
export PATH=$PATH:/usr/local/opt/dart/libexec

export PATH=$PATH:$HOME/.dotfiles/bin

# gore
export GORE_HOME=$HOME/.config/gore

# favdir
export FAVDIR_HOME=$HOME/.config/favdir

# enhancd
export ENHANCD_DIR=$HOME/.config/enhancd
export ENHANCD_FILTER="fzf"

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"