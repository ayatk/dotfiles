if (( $+commands[brew] )); then
  function update() {
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
  }
fi
