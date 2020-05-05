"---------------------------------------------------------------------------
" Search:
"

" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase

" Enable incremental search.
set incsearch
" Don't highlight search result.
set nohlsearch

" Searches wrap around the end of the file.
set wrapscan


"---------------------------------------------------------------------------
" Edit:
"

" Smart insert tab setting.
set expandtab
" Substitute <Tab> with blanks.
set tabstop=2
" Spaces instead <Tab>.
set softtabstop=2
" Autoindent width.
set shiftwidth=2
" Round indent by shiftwidth.
set shiftround

" Enable smart indent.
set autoindent smartindent

" Use clipboard register.
set clipboard+=unnamedplus

if filereadable(glob('~/.bashenv'))
  let $BASH_ENV=expand('~/.bashenv')
endif

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight <>.
set matchpairs+=<:>

" Display another buffer when current buffer isn't saved.
set hidden

" Use ripgrep.
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --fixed-strings\ --no-ignore
set grepformat=%f:%l:%c:%m,%f:%l:%m

" CursorHold time.
set updatetime=500

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

" Disable paste.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif

" Update diff.
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" If true Vim master, use English help file.
set helplang& helplang=en,ja

"---------------------------------------------------------------------------
" View:
"

" Show line number.
set number
" Show <TAB> and <CR>
set list
set listchars=tab:^\ ,extends:>,precedes:<,eol:$
" Always display statusline.
set laststatus=2
" Disable tabline.
set showtabline=2

" Do not display the greetings message at the time of Vim start.
set shortmess=aTIc

" Do not display the completion messages
set noshowmode
if has('patch-7.4.314')
  set shortmess+=c
endif

" Don't create backup.
set nobackup
set noswapfile

" Set undofile.
set undofile
set undodir=$HOME/.vim/files/undo/

" Disable bell.
set t_vb=
set novisualbell
set belloff=all

" Display candidates by popup menu.
set wildmenu
set wildmode=full
set wildoptions+=pum

if has('nvim')
  set shada=!,'100,<50,s10,h
else
  set viminfo=!,'100,<50,s10,h
endif

" Completion setting.
set completeopt=menuone
" Set popup menu max height.
set pumheight=7

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window right the current one.
set splitright
" Set minimal width for current window.
" set winwidth=30
" Set minimal height for current window.
" set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

" When a line is long, do not omit it in @.
set display=lastline

" For conceal.
set conceallevel=2 concealcursor=niv

" Cursor line always be in the middle
set scrolloff=9999

" Prevent terminal buffer flickering
autocmd MyAutoCmd TermOpen,TermEnter * setlocal scrolloff=0
autocmd TermLeave * setlocal scrolloff=9999

" Don't resize windows automatically
set noequalalways

" Indicate maximum line length for readability
set colorcolumn=120

" Force wrap
set wrap
autocmd MyAutoCmd VimEnter,FilterWritePost * if &diff | setlocal wrap | endif
