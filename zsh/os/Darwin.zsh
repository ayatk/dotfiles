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

show_virtual_env() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "(virtualenv)"
    fi
}
