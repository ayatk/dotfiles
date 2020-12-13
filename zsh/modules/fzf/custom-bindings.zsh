if (( $+commands[ghq] )); then
  function _fast_move_git_repo() {
    BUFFER="cd $(ghq root)/$(ghq list >/dev/null | fzf --reverse +m)"
    zle accept-line
  }

  zle -N _fast_move_git_repo
  bindkey '^f' _fast_move_git_repo
fi
