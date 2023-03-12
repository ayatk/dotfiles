# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="${XDG_DATA_HOME}/npm/bin:$PATH"

# node
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history

# n
export N_PREFIX=$XDG_DATA_HOME/n
export PATH="$N_PREFIX/bin:$PATH"

# pnpm
export PNPM_HOME=$XDG_DATA_HOME/pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
