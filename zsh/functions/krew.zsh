# krew
if (( $+commands[krew] )); then
  export KREW_ROOT=$XDG_DATA_HOME/krew
  export PATH="$KREW_ROOT/bin:$PATH"
fi
