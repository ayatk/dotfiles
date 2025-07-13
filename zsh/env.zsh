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
    $(brew --prefix)/share/zsh-completions(N)
    $(brew --prefix)/share/zsh/site-functions(N)
    $fpath(N)
  )
fi

# --------
# asdf
# --------
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/config"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
path=("$ASDF_DATA_DIR"/shims $path)
export ASDF_NODEJS_AUTO_ENABLE_COREPACK=true

# --------
# rbenv
# --------
export RUBY_CONFIGURE_OPTS=--enable-yjit

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
  source <(fzf --zsh)
fi

# --------
# go
# --------
export GOPATH=$HOME
path+=("$GOPATH/bin")
if [[ "$(uname -r)" == *microsoft* ]]; then
  path+=(/usr/local/go/bin(N-/))
fi

# --------
# ghq
# --------
export GHQ_ROOT=$GOPATH/src

# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# --------
# httpie
# --------
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"

# --------
# npm
# --------
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
path+=("${XDG_DATA_HOME}/npm/bin"(N-/))

# --------
# node
# --------
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_history

# --------
# pnpm
# --------
export PNPM_HOME=$XDG_DATA_HOME/pnpm
path+=("$PNPM_HOME"(N-/))

# --------
# bundle
# --------
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# --------
# ruby
# --------
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc

# --------
# rust
# --------
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

if [[ -s "${CARGO_HOME}/env" ]]; then
  source "${CARGO_HOME}/env"
fi

# wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# --------
# 1password
# --------
if [[ -s ${XDG_CONFIG_HOME}/op/plugins.sh ]]; then
  source ${XDG_CONFIG_HOME}/op/plugins.sh
fi

# --------
# vscode
# --------
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
if [[ "$(uname -r)" = *microsoft* ]]; then
  path+=("/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin")
fi

# ssh
if [[ "$(uname -r)" = *microsoft* ]]; then
  path=('/mnt/c/Windows/System32/OpenSSH' $path)
fi
