"---------------------------------------------------------------------------
" For Mac:
"

" Use sh. It is faster
set shell=sh

"---------------------------------------------------------------------------
" For CUI:
"

" Enable 256 color terminal.
set t_Co=256

if has('nvim')

else
  let &t_ti.="\e[1 q"
  let &t_te.="\e[0 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
endif

if exists('+termguicolors')
  set termguicolors
endif

" Enable the mouse.
set mouse=a

" Colorscheme
set background=dark
colorscheme alduin
