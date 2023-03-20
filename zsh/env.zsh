# bin files
export DOTPATH=${DOTPATH:-~/src/github.com/ayatk/dotfiles}
path+=("${DOTPATH}/bin")

# --------
# homebrew
# --------
if [[  $(uname -sm) == "Darwin arm64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
if (( $+commands[brew] )); then
  function update() {
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
  }

  fpath=(
    $(brew --prefix)/share/zsh-completions
    $(brew --prefix)/share/zsh/site-functions
    $fpath
  )
  autoload -Uz compinit
  compinit
fi

# --------
# asdf
# --------
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/config"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

if [[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
else
  export ASDF_DIR="$XDG_DATA_HOME/asdf"
  source $ASDF_DIR/asdf.sh
fi

# --------
# aws
# --------
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials

# --------
# docker
# --------
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# --------
# fzf
# --------
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

# --------
# go
# --------
export GOPATH=$HOME
path+=("$GOPATH/bin")
if [[ "$(uname -r)" == *microsoft* ]]; then
  path+=("/usr/local/go/bin")
fi

# --------
# ghq
# --------
export GHQ_ROOT=$GOPATH/src

# --------
# httpie
# --------
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"


# --------
# npm
# --------
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
path+=("${XDG_DATA_HOME}/npm/bin")

# --------
# node
# --------
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_history

# --------
# pnpm
# --------
export PNPM_HOME=$XDG_DATA_HOME/pnpm
path+=("$PNPM_HOME")

# --------
# pyenv
# --------
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
if (( $+commands[pyenv] )); then
  path+=("$PYENV_ROOT/bin")
  eval "$(pyenv init --path)"
fi

# --------
# jupyter
# --------
if (( $+commands[jupyter] )); then
  export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
  export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
fi

# --------
# bundle
# --------
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# --------
# ruby gem
# --------
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

# --------
# rust
# --------
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

if [[ -s "${CARGO_HOME}/env" ]]; then
  source "${CARGO_HOME}/env"
fi

# --------
# vscode
# --------
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
if [[ "$(uname -r)" = *microsoft* ]]; then
  path+=("/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin")
fi
