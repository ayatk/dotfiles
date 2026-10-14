# bin files
export DOTPATH=${DOTPATH:-~/src/github.com/ayatk/dotfiles}
path=("${DOTPATH}/bin" $path)

# --------
# homebrew
# --------
[[ $(uname -sm) == "Darwin arm64" ]] && eval $(/opt/homebrew/bin/brew shellenv)
if (( $+commands[brew] )); then
  function update() {
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
  }
fi

# --------
# mise
# --------
(( $+commands[mise] )) && eval "$(mise activate zsh)"

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
# rancher desktop
path=("$HOME/.rd/bin" $path)

# --------
# fzf
# --------
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  export FZF_COMPLETION_OPTS='+c -x'

  # Use fd (faster, respects .gitignore) instead of ag/find
  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

    _fzf_compgen_path() {
      fd --hidden --follow --exclude .git . "$1"
    }

    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude .git . "$1"
    }
  elif (( $+commands[ag] )); then
    # Fallback to ag if fd not available
    _fzf_compgen_path() {
      ag -g "" "$1"
    }
  fi

  # Load fzf default bindings (Ctrl+T, Alt+C, Ctrl+R)
  source <(fzf --zsh)

  # Re-bind Ctrl+F for ghq integration (overrides fzf defaults)
  if (( $+commands[ghq] )); then
    function _fast_move_git_repo() {
      local selected_repo=$(ghq list | fzf --reverse +m)
      if [[ -n "$selected_repo" ]]; then
        local target_dir="$(ghq root)/$selected_repo"
        BUFFER="cd ${(q)target_dir}"
        print -s "cd ${(q)target_dir}"  # Add to history explicitly
        zle accept-line
      else
        zle reset-prompt
      fi
    }
    zle -N _fast_move_git_repo
    bindkey '^f' _fast_move_git_repo
  fi
fi

# --------
# go
# --------
export GOPATH=$HOME
path=("$GOPATH/bin" $path)
if [[ "$(uname -r)" == *microsoft* ]]; then
  path=("/usr/local/go/bin" $path)
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
path=("${XDG_DATA_HOME}/npm/bin" $path)

# --------
# node
# --------
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_history

# --------
# pnpm
# --------
export PNPM_HOME=$XDG_DATA_HOME/pnpm
path=("$PNPM_HOME" $path)

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
export RUBY_CONFIGURE_OPTS=--enable-yjit

# --------
# rust
# --------
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

[[ -s "${CARGO_HOME}/env" ]] && source "${CARGO_HOME}/env"

# --------
# terraform
# --------
alias tf=terraform

# --------
# wget
# --------
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
  path=("/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin" $path)
fi

# --------
# less
# --------
export LESSHISTFILE="$XDG_STATE_HOME"/less_history

# --------
# mysql
# --------
export MYSQL_HISTFILE="$XDG_STATE_HOME"/mysql_history

# --------
# psql
# --------
export PSQL_HISTORY="$XDG_STATE_HOME"/psql_history

# --------
# ripgrep
# --------
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep/config

# --------
# bat
# --------
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME"/bat/config

# --------
# python
# --------
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc

# --------
# jupyter
# --------
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# --------
# gnupg
# --------
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# --------
# sqlite
# --------
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite_history
# ssh
if [[ "$(uname -r)" = *microsoft* ]]; then
  path=('/mnt/c/Windows/System32/OpenSSH' $path)
fi
