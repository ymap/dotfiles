"---------------------------------------------------------------------------
" Initialize:
"

let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
  return s:is_windows
endfunction

function! IsMac() abort
  return !s:is_windows && !has('win32unix')
    \ && (has('mac') || has('macunix') || has('gui_macvim')
    \   || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

set encoding=utf-8
set fileencodings=utf-8,sjis,cp932,euc-jp

" Use English interface.
language message C

" Use Space instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = "\<space>"

" Load dein.
let s:dein_dir = expand('~/.vim/dein') . '/repos/github.com/Shougo/dein.vim/'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif


"---------------------------------------------------------------------------
" Disable default plugins

let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
