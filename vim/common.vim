"----------------------------------------------------
" common.vim
"----------------------------------------------------

" Encoding (I HATE SHIFT_JIS!!!!)
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" enable syntax
syntax enable

" disable vi compatible
set nocompatible

" set incremental search
set incsearch

" show corresponds bracket
set showmatch

" convert tab to space
set expandtab
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

" disable buckup
set nobackup

" remove BOM
set nobomb

let g:loaded_matchparen = 1

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" ペースト設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
