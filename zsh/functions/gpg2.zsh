if (( $+commands[gpg-agent] )); then
    pgrep -q gpg-agent || eval $(gpg-agent --daemon --write-env-file ${HOME}/.gpg-agent-info)
    [ -f ${HOME}/.gpg-agent-info ] && source ${HOME}/.gpg-agent-info
    export GPG_AGENT_INFO
    export GPG_TTY=$(tty)
fi
