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

if has('vim_starting') && !exists('veonim')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif
