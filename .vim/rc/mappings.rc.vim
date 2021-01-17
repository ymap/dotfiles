inoremap <C-c> <C-[>
inoremap <silent> jj <C-[>
inoremap <silent> <C-t> i<BS><C-o>:silent! undojoin \| call setreg("y", getreg("\"")) \| normal! h"zx"zp<CR><C-o>:call setreg("\"", getreg("y"))<CR>
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> <Down> gj
noremap <silent> <Up> gk
noremap <silent> gj j
noremap <silent> gk k

" Command-line mode keymappings:
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>

" edit alternate file
nnoremap <silent> # <C-^>

" replace redraw mapping
nnoremap <silent> g<C-l> <C-l>
