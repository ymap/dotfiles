" dein configurations.

let g:dein#auto_recache = 1
let g:dein#enable_notification = 1
let g:dein#install_log_filename = '~/dein.log'

let s:path = expand('~/.vim/dein')

" if !dein#load_state(s:path)
"   finish
" endif

let s:toml = '~/.vim/rc/dein.toml'
let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'
let s:ft_toml = '~/.vim/rc/dein_ft.toml'

call dein#begin(s:path, [
      \ expand('<sfile>'), expand(s:toml), expand(s:lazy_toml), expand(s:ft_toml)
      \ ])

call dein#load_toml(s:toml, {'lazy' : 0})
call dein#load_toml(s:lazy_toml,{'lazy' : 1})
call dein#load_toml(s:ft_toml)

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
