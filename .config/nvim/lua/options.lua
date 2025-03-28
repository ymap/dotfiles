local options = {
  background    = 'dark',
  backspace     = { 'indent', 'eol', 'start' },
  backup        = false,
  clipboard     = 'unnamedplus',
  cmdheight     = 2,
  cmdwinheight  = 5,
  colorcolumn   = '120',
  completeopt   = 'menuone',
  display       = 'lastline',
  equalalways   = true,
  expandtab     = true,
  fileencodings = { 'utf-8', 'sjis', 'cp932', 'euc-jp' },
  foldenable    = false,
  formatoptions = 'tcqjmMBl',
  grepprg       = 'rg --vimgrep --no-heading --smart-case',
  helpheight    = 12,
  helplang      = { 'en', 'ja' },
  hidden        = true,
  ignorecase    = true,
  keywordprg    = ':help',
  list          = true,
  listchars     = { tab = '^ ', extends = '>', precedes = '<', eol = '$' },
  matchpairs    = vim.opt.matchpairs + { '<:>' },
  mouse         = 'a',
  mousescroll   = 'ver:1,hor:6',
  number        = true,
  packpath      = '',
  previewheight = 8,
  pumblend      = 10,
  pumheight     = 7,
  pyxversion    = 3,
  report        = 0,
  scrollback    = 100000,
  scrolloff     = 9999,
  shada         = { '!', "'100", '<50', 's10', 'h' },
  shiftround    = true,
  shiftwidth    = 2,
  shortmess     = 'aTIc',
  showmode      = false,
  showtabline   = 2,
  smartcase     = true,
  softtabstop   = 2,
  splitright    = true,
  swapfile      = false,
  tabstop       = 2,
  termguicolors = true,
  undofile      = true,
  updatetime    = 500,
  virtualedit   = 'block',
  wildmenu      = true,
  wildmode      = 'full',
}

for name, value in pairs(options) do vim.opt[name] = value end

local global_variables = {
  loaded_2html_plugin      = 1,
  loaded_getscriptPlugin   = 1,
  loaded_gzip              = 1,
  loaded_logiPat           = 1,
  loaded_man               = 1,
  loaded_matchit           = 1,
  loaded_matchparen        = 1,
  loaded_python_provider   = 1,
  loaded_rrhelper          = 1,
  loaded_shada_plugin      = 1,
  loaded_spellfile_plugin  = 1,
  loaded_tarPlugin         = 1,
  loaded_tutor_mode_plugin = 1,
  loaded_vimballPlugin     = 1,
  loaded_zipPlugin         = 1,
  loaded_netrw             = 1,
  mapleader                = ' ',
  no_plugin_maps           = 1,
  python_host_prog         = '',
  t_vb                     = '',
}

for name, value in pairs(global_variables) do vim.g[name] = value end

local autocmds = {
  {
    "FocusGained",
    {
      callback = function() vim.cmd.checktime() end,
    },
  },
  {
    "InsertLeave",
    {
      callback = function() if vim.o.diff then vim.cmd.diffupdate() end end
    },
  },
  {
    "InsertLeave",
    {
      callback = function() if vim.o.paste then vim.bo.paste = false end end
    },
  },
  {
    "TermOpen",
    {
      callback = function() vim.bo.modifiable = true end
    },
  },
  {
    "Filetype",
    {
      pattern = "yaml",
      callback = function()
        vim.bo.indentkeys = "o,O,*<Return>,!^F"; vim.bo.indentexpr = ""
      end
    },
  },
  {
    "Filetype",
    {
      pattern = "gitcommit",
      callback = function() vim.wo.colorcolumn = "72" end
    },
  },
  {
    "Filetype",
    {
      pattern = "sh",
      callback = function() vim.bo.filetype = "bash" end
    },
  },
  {
    {
      "BufNewFile",
      "BufRead",
    },
    {
      pattern = "*.bash",
      callback = function() vim.bo.filetype = "bash" end
    },
  },
}

for _, args in ipairs(autocmds) do vim.api.nvim_create_autocmd(unpack(args)) end
