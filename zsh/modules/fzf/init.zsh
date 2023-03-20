if (( ! $+commands[fzf] )); then
  return 0
fi

# Key bindings
# ------------
source "${0:h}/custom-bindings.zsh"
