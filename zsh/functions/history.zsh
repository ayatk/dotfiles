function select-history() {
	BUFFER=$(history -n -r 1 | fzf +m --query "$LBUFFER" --prompt="History > ")
	CURSOR=$BUFFER
	zle accept-line
}

zle -N select-history
bindkey '^r' select-history
