# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

if [[ -s "${CARGO_HOME}/env" ]]; then
  source "${CARGO_HOME}/env"
fi
