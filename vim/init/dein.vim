"----------------------------------------------------
" dein.vim
"----------------------------------------------------
if &compatible
  set nocompatible
endif

let s:vim_dir = expand('$XDG_CONFIG_HOME/vim/')

" Required:
let s:dein_dir = s:vim_dir . 'dein/'
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath+=' . s:dein_repo_dir

let s:toml      = s:vim_dir . 'init/dein.toml'
let s:lazy_toml = s:vim_dir . 'init/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(expand(s:dein_dir))

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
