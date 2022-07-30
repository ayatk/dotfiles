# init homebrew
if [[  $(uname -sm) == "Darwin arm64" ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# init prezto settings
source "${ZDOTDIR}/preztorc.zsh"

# defined base environment.
source "${ZDOTDIR}/profile.zsh"

# envs
source "${ZDOTDIR}/env.zsh"
for func (${ZDOTDIR}/envs/*) source $func:a

# options
source "${ZDOTDIR}/options.zsh"

# os settings
source "${ZDOTDIR}/os/$(uname).zsh"

if [[ -s "${ZDOTDIR}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR}/.zprezto/init.zsh"
fi

# functions
for func (${ZDOTDIR}/functions/*) source $func:a

# zsh completion
if [ -e $(brew --prefix)/share/zsh-completions ]; then
    fpath=($(brew --prefix)/share/zsh-completions $fpath)
fi

# zsh site-functions
if [ -e $(brew --prefix)/share/zsh/site-functions ]; then
    fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi
