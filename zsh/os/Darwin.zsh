if (( $+commands[brew] )); then
  function update() {
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
  }
fi

# java
export PATH=/usr/local/opt/openjdk/bin:$PATH

# Android
if (( $+commands[android] )); then
  export ANDROID_HOME=/usr/local/share/android-sdk
fi

# openssl
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

if (( $+commands[go] )); then
  export GOROOT=/usr/local/opt/go/libexec
fi

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
