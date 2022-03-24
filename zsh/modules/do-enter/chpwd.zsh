function _chpwd {
  if [[ $PWD != $HOME ]]; then
    ls_abbrev
  fi
}

add-zsh-hook chpwd _chpwd
