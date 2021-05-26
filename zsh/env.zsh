# bin files
export DOTPATH=${DOTPATH:-$HOME/.dotfiles}
PATH="${PATH:+${PATH}:}$DOTPATH/bin"

# docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# gradle
if (( $+commands[gradle] )); then
  export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
fi

# httpie
if (( $+commands[http] )); then
  export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
fi

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Ruby Gem
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# Golang
export GOPATH=$HOME
if (( $+commands[go] )); then
  export GOROOT=/usr/local/opt/go/libexec
  export GO111MODULE=on
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# openssl
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

# ghq
export GHQ_ROOT=$GOPATH/src

# krew
export KREW_ROOT=$XDG_DATA_HOME/krew
export PATH="$KREW_ROOT/bin:$PATH"

# pipenv
if (( $+commands[pipenv] )); then
  export PIPENV_VENV_IN_PROJECT=1
fi

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

if (( $+commands[n] )); then
  export N_PREFIX=$XDG_DATA_HOME
  export PATH="$N_PREFIX/bin:$PATH"
fi
