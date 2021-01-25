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
if (( $+commands[java] )); then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
  PATH=${JAVA_HOME}/bin:${PATH}
fi

# Android
if (( $+commands[android] )); then
  export ANDROID_HOME=/usr/local/share/android-sdk
fi
