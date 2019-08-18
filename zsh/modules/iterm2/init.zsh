if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi


if zstyle -t ':prezto:module:iterm2' dot-expansion; then
  bindkey -M isearch . self-insert 2> /dev/null
fi

export ITERM2_SQUELCH_MARK=1

source "${0:h}/integration.zsh"
