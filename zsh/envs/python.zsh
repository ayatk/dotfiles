# pipenv
if (( $+commands[pipenv] )); then
  export PIPENV_VENV_IN_PROJECT=1
fi

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# jupyter
export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
