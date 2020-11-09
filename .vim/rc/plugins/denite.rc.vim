"---------------------------------------------------------------------------
" denite.nvim
"

if executable('rg')
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--ignore-case', '--fixed-strings', '--no-ignore', '-g', '!coverage', '-g', '!log'])
endif

call denite#custom#source('file/old', 'matchers',
    \ ['matcher/project_files'])

call denite#custom#source('file/old', 'max_candidates',
    \ 2000)

call denite#custom#source('file/old', 'converters',
    \ ['converter/relative_word'])

call denite#custom#source('grep', 'converters', ['converter_abbr_word'])
call denite#custom#option('_', 'root_markers', '.projections.json')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')
call denite#custom#option('_', 'start_filter', v:true)
call denite#custom#option('_', {
    \ 'highlight_filter_background': 'CursorLine',
    \ 'highlight_matched-char': 'Search',
    \ 'source_names': 'short',
    \ 'split': 'floating',
    \ })
