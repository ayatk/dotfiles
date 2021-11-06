# bin files
export DOTPATH=${DOTPATH:-$HOME/.dotfiles}
PATH="${PATH:+${PATH}:}$DOTPATH/bin"

# docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# gradle
if (( $+commands[gradle] )); then
  export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
fi

# httpie
if (( $+commands[http] )); then
  export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
fi

# Golang
export GOPATH=$HOME
if (( $+commands[go] )); then
  export GOROOT=/usr/local/opt/go/libexec
  export GO111MODULE=on
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# ghq
export GHQ_ROOT=$GOPATH/src

# fzf
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  export FZF_COMPLETION_OPTS='+c -x'

  # Use ag instead of the default find command for listing candidates.
  # - The first argument to the function is the base path to start traversal
  # - Note that ag only lists files not directories
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    ag -g "" "$1"
  }
fi
