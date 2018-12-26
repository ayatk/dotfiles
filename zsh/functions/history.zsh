if (( $+commands[fzf] )); then
    function select-history() {
        BUFFER=$(history -n -r 1 | uniq | fzf +m --reverse --query "$LBUFFER" --prompt="History > ")
    zle accept-line
    }

    zle -N select-history
    bindkey '^r' select-history
fi
