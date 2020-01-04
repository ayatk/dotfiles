"----------------------------------------------------
" color.vim
"----------------------------------------------------
set t_Co=256
set termguicolors

" color scheme
syntax enable
source ~/.vim/colors/iceberg.vim

" set background=light
" colorscheme solarized
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

" show line number
set number

" relative line number
set relativenumber

" highlight cursor line
set cursorline
hi clear CursorLine

" show cursor place
set ruler

" enable search highlight
set hlsearch

set laststatus=2

if has('mouse') && !exists('veonim')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif
