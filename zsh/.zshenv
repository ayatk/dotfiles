# ~/.zshenv で ZDOTDIR を設定した後に読まれる。非対話シェル（zsh -c やエディタ・ツールからの起動）でも
# 参照されるため、XDG とツールの保存先の指定はここに集約する。毎回読まれるので外部コマンドは呼ばない。
export ZDOTDIR

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# aws
export AWS_CONFIG_FILE="${AWS_CONFIG_FILE:-$XDG_CONFIG_HOME/aws/config}"
export AWS_SHARED_CREDENTIALS_FILE="${AWS_SHARED_CREDENTIALS_FILE:-$XDG_CONFIG_HOME/aws/credentials}"

# docker
export DOCKER_CONFIG="${DOCKER_CONFIG:-$XDG_CONFIG_HOME/docker}"

# go
# ghq の root は従来の GOPATH/src（~/src）を維持するため GOPATH から切り離して明示する。
export GOPATH="${GOPATH:-$XDG_DATA_HOME/go}"
export GOMODCACHE="${GOMODCACHE:-$XDG_CACHE_HOME/go/mod}"
export GHQ_ROOT="${GHQ_ROOT:-$HOME/src}"

# gradle
export GRADLE_USER_HOME="${GRADLE_USER_HOME:-$XDG_DATA_HOME/gradle}"

# httpie
export HTTPIE_CONFIG_DIR="${HTTPIE_CONFIG_DIR:-$XDG_CONFIG_HOME/httpie}"

# node / npm / pnpm
export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/npmrc}"
export NODE_REPL_HISTORY="${NODE_REPL_HISTORY:-$XDG_STATE_HOME/node_history}"
export PNPM_HOME="${PNPM_HOME:-$XDG_DATA_HOME/pnpm}"

# ruby
export BUNDLE_USER_CONFIG="${BUNDLE_USER_CONFIG:-$XDG_CONFIG_HOME/bundle}"
export BUNDLE_USER_CACHE="${BUNDLE_USER_CACHE:-$XDG_CACHE_HOME/bundle}"
export BUNDLE_USER_PLUGIN="${BUNDLE_USER_PLUGIN:-$XDG_DATA_HOME/bundle}"
export GEM_HOME="${GEM_HOME:-$XDG_DATA_HOME/gem}"
export GEM_SPEC_CACHE="${GEM_SPEC_CACHE:-$XDG_CACHE_HOME/gem}"
export IRBRC="${IRBRC:-$XDG_CONFIG_HOME/irb/irbrc}"

# rust
export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"

# python
# PYTHON_HISTORY は 3.13 以降で有効。PYTHONSTARTUP は存在しないと起動のたびに警告が出るためファイルがある時だけ設定する。
export PYTHON_HISTORY="${PYTHON_HISTORY:-$XDG_STATE_HOME/python_history}"
[[ -r "$XDG_CONFIG_HOME/python/pythonrc" ]] && export PYTHONSTARTUP="${PYTHONSTARTUP:-$XDG_CONFIG_HOME/python/pythonrc}"
export JUPYTER_CONFIG_DIR="${JUPYTER_CONFIG_DIR:-$XDG_CONFIG_HOME/jupyter}"

# 各種 CLI の設定ファイル・履歴
# 設定ファイルを指す変数は、存在しないと wget がエラー・rg が警告を出すためファイルがある時だけ設定する。
[[ -r "$XDG_CONFIG_HOME/wgetrc" ]] && export WGETRC="${WGETRC:-$XDG_CONFIG_HOME/wgetrc}"
[[ -r "$XDG_CONFIG_HOME/ripgrep/config" ]] && export RIPGREP_CONFIG_PATH="${RIPGREP_CONFIG_PATH:-$XDG_CONFIG_HOME/ripgrep/config}"
[[ -r "$XDG_CONFIG_HOME/bat/config" ]] && export BAT_CONFIG_PATH="${BAT_CONFIG_PATH:-$XDG_CONFIG_HOME/bat/config}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_STATE_HOME/less_history}"
export MYSQL_HISTFILE="${MYSQL_HISTFILE:-$XDG_STATE_HOME/mysql_history}"
export PSQL_HISTORY="${PSQL_HISTORY:-$XDG_STATE_HOME/psql_history}"
export SQLITE_HISTORY="${SQLITE_HISTORY:-$XDG_STATE_HOME/sqlite_history}"
