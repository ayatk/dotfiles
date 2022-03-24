function ls_abbrev {
  if [[ ! -r $PWD ]]; then
    return
  fi
  # -A : Do not ignore entries starting with ..
  # -C : Force multi-column output.
  # -F : Append indicator (one of */=>@|) to entries.
  local ls_result=$(CLICOLOR_FORCE=1 ls -ACF)
  local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

  if [ $ls_lines -gt 10 ]; then
    echo "$ls_result" | head -n 5
    echo '...'
    echo "$ls_result" | tail -n 5
    echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
  else
    echo "$ls_result"
  fi
}

# https://qiita.com/yuyuchu3333/items/e9af05670c95e2cc5b4d
function do_enter {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi
  echo
  ls_abbrev
  echo
  if (($ + $(git rev-parse --is-inside-work-tree 2>/dev/null))); then
    echo -e "\e[0;33m--- git status ---\e[0m"
    git status -sbu
    echo
  fi
  zle reset-prompt
}

zle -N do_enter
bindkey '^m' do_enter
