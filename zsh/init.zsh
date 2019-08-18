# init prezto settings
source "${ZDOTDIR}/preztorc.zsh"

if [[ -s "${ZDOTDIR}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR}/.zprezto/init.zsh"
fi

# defined base environment.
source "${ZDOTDIR}/profile.zsh"

# envs
source "${ZDOTDIR}/env.zsh"

# options
source "${ZDOTDIR}/options.zsh"

# os settings
source "${ZDOTDIR}/os/$(uname).zsh"

# functions
for func (${ZDOTDIR}/functions/*) source $func:a

# zsh completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)
