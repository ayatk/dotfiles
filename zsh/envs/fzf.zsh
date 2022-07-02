# fzf
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
  export FZF_COMPLETION_OPTS='+c -x'

  # Use ag instead of the default find command for listing candidates.
  # - The first argument to the function is the base path to start traversal
  # - Note that ag only lists files not directories
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    ag -g "" "$1"
  }
fi
