if (( ! $+commands[fzf] )); then
  return 0
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${0:h}/external/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${0:h}/external/shell/key-bindings.zsh"
source "${0:h}/custom-bindings.zsh"
