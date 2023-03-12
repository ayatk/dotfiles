export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/config"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"

if [[ -s "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
else
  export ASDF_DIR="$XDG_DATA_HOME/asdf"
  source $ASDF_DIR/asdf.sh
fi

