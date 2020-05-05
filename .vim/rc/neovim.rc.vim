"---------------------------------------------------------------------------
" For neovim:
"

if has('vim_starting') && empty(argv())
  syntax off
endif

set pyxversion=3
let g:python_host_prog  = ''
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 1

if exists('&inccommand')
  set inccommand=nosplit
endif

" When got focus, check if any buffer has modified
autocmd MyAutoCmd FocusGained * checktime

" Modifiable terminal
" Auto close terminal
autocmd MyAutoCmd TermOpen * setlocal modifiable bufhidden=wipe

set scrollback=100000
