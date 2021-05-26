if (( $+commands[brew] )); then
  # brew docterでpyenvのpathがエラーが出るので
  alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"

  function update() {
    brew update
    brew upgrade
    brew cask upgrade
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
