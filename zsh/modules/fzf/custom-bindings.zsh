if (( $+commands[ghq] )); then
  function _fast_move_git_repo() {
    local selected_repo=$(ghq list | fzf --reverse +m)
    if [[ -n "$selected_repo" ]]; then
      local target_dir="$(ghq root)/$selected_repo"
      BUFFER="cd $target_dir"
      print -s "cd $target_dir"  # Add to history explicitly
      zle accept-line
    fi
  }

  zle -N _fast_move_git_repo
  bindkey '^f' _fast_move_git_repo
fi

function _select-history() {
  BUFFER=$(history -n -r 1 | fzf --reverse +m)
  zle accept-line
}
zle -N _select-history
bindkey '^r' _select-history
