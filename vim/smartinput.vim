" call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
"       \                        '<BS>',
"       \                        '<BS>')
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
"       \                        '<BS>',
"       \                        '<C-h>')
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
"       \                        '<Enter>',
"       \                        '<Enter>')

" " <BS> で閉じて文字削除
" imap <expr> <BS>
"       \ neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"
" " <C-h> で閉じる
" imap <expr> <C-h>
"       \ neocomplete#smart_close_popup()
" " <CR> で候補を選択し改行する
" " ポップアップがないときには改行する
" imap <expr> <CR> pumvisible() ?
"       \ neocomplete#close_popup() : "\<Plug>(smartinput_CR)"
