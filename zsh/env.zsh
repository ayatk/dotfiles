# bin files
export DOTPATH="${XDG_CONFIG_HOME:-$HOME/.config}/mise"
path=("${DOTPATH}/bin" $path)

# --------
# homebrew
# --------
[[ $(uname -sm) == "Darwin arm64" && -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
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
# docker
# --------
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
path=(${GOPATH:+$GOPATH/bin} $path)
if [[ "$(uname -r)" == *microsoft* ]]; then
  path=("/usr/local/go/bin" $path)
fi

# --------
# npm
# --------
path=(${XDG_DATA_HOME:+$XDG_DATA_HOME/npm/bin} $path)

# --------
# pnpm
# --------
path=(${PNPM_HOME:+$PNPM_HOME} $path)

# --------
# ruby
# --------
export RUBY_CONFIGURE_OPTS=--enable-yjit

# --------
# rust
# --------
[[ -s "${CARGO_HOME}/env" ]] && source "${CARGO_HOME}/env"

# --------
# terraform
# --------
alias tf=terraform

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
# gnupg
# --------
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# ssh
if [[ "$(uname -r)" = *microsoft* ]]; then
  path=('/mnt/c/Windows/System32/OpenSSH' $path)
fi
