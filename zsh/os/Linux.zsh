test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if (( $+commands[brew] )); then
  eval $($(brew --prefix)/bin/brew shellenv)
fi
