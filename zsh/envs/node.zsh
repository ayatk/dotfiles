# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# n
if (( $+commands[n] )); then
  export N_PREFIX=$XDG_DATA_HOME/n
  export PATH="$N_PREFIX/bin:$PATH"
fi

# yarn
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
