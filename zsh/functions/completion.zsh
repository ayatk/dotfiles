# hub alias
if (( $+commands[hub] )); then
  eval "$(hub alias -s)"
fi

# direnv
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi
