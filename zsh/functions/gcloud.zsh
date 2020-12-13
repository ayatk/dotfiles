if (( $+commands[gcloud] && $+commands[brew] )); then
  export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi
