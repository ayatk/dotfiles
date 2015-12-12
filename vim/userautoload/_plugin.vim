" =============================
" NeoBundle
" =============================

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" Echo startup time on start
if has('vim_starting') && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
    \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

if ! isdirectory(expand('~/.vim/bundle'))
    echon "Installing neobundle.vim..."
    silent call mkdir(expand('~/.vim/bundle'), 'p')
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    echo "done."
    if v:shell_error
        echoerr "neobundle.vim installation has failed!"
        finish
    endif
endif

if has('vim_starting')
    if &compatible
    set nocompatible               " Be iMproved
    endif
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/unite.vim'

NeoBundle 'Shougo/neomru.vim'
" Shougo/neocomplete
if has('lua') && v:version >= 703
    NeoBundle 'Shougo/neocomplete.vim'
else
    NeoBundle 'Shougo/neocomplcache.vim'
endif
" snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

" UI
NeoBundle 'itchyny/lightline.vim'

" Coler watch
NeoBundle 'cocopon/colorswatch.vim'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
