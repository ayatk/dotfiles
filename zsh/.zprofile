#! /bin/env zsh

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
    export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    $path
)

export XDG_CONFIG_HOME=$HOME/.config

# Android
export ANDROID_HOME=/usr/local/share/android-sdk

# Golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
PATH=${JAVA_HOME}/bin:${PATH}

export PATH=$PATH:$HOME/.dotfiles/bin

# openssl
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

# pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_COMPLETION_OPTS='+c -x'

# alls() {
#   zle accept-line
#   if [[ -z "$BUFFER" ]]; then
#     echo ''
#     ls
#   fi
# }
# zle -N alls
# bindkey "^\n" alls


# Use ag instead of the default find command for listing candidates.
# - The first argument to the function is the base path to start traversal
# - Note that ag only lists files not directories
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    ag -g "" "$1"
}

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
