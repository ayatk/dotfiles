# suffix alias
alias -s txt='cat'
alias -s rb='ruby'
alias -s py='python'

# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'

if (( $+commands[yt-dlp] )); then
  alias dl='yt-dlp'
fi

if (( $+commands[kubectl] )); then
  alias k='kubectl'
fi

alias seishin-to-tokinoheya='cd $(mktemp -d)'

# nvim aliases with existence check
if (( $+commands[nvim] )); then
  alias vim='nvim'
  alias v='nvim'
  alias -g V='| nvim -'
else
  alias v='vim'
  alias -g V='| vim -'
fi

# zshの便利なエイリアス
alias -g N='>/dev/null 2>&1'

# ディレクトリ操作
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 安全な操作
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
