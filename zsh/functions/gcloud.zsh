if [[ -s "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk" ]] && (( $+commands[brew] )); then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi
