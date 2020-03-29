if (( $+commands[ghq] )); then
  function _fast_move_git_repo() {
    local dir
    dir=$(ghq list >/dev/null | fzf --reverse +m) && \
      cd $(ghq root)/$dir && \
      git sync
    zle accept-line
  }

  zle -N _fast_move_git_repo
  bindkey '^f' _fast_move_git_repo
fi
