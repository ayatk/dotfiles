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
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh site-functions
fpath=(/usr/local/share/zsh/site-functions $fpath)
