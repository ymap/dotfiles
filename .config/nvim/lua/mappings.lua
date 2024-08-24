local key_mappings = {
  n = {
    ['j']            = 'gj',
    ['k']            = 'gk',
    ['<Down>']       = 'gj',
    ['<Up>']         = 'gk',
    ['gj']           = 'j',
    ['gk']           = 'k',
    ['<leader><CR>'] = function()
      local cmd

      if vim.bo.filetype == "typescript" then
        cmd = "npx tsx"
      elseif vim.bo.filetype == "javascript" then
        cmd = "node"
      else
        cmd = vim.bo.filetype
      end

      vim.cmd("vsplit | te " .. cmd .. " %")
    end,
    ['<leader>br']   = ':<C-u>vsplit | te w3m<CR>',
    ['<C-h>']        = '10<C-w>>',
    ['<C-j>']        = '10<C-w>+',
    ['<C-k>']        = '10<C-w>-',
    ['<C-l>']        = '10<C-w><',
  },
  i = {
    ['<C-c>'] = '<Esc>',
  },
}

for mode, mappings in pairs(key_mappings) do
  for from, to in pairs(mappings) do
    vim.keymap.set(mode, from, to, { silent = true, noremap = true })
  end
end

local keys_to_delete_mapping = {
  n = {
    'Y'
  },
}

for mode, keys in pairs(keys_to_delete_mapping) do
  for _, key in pairs(keys) do
    vim.keymap.del(mode, key)
  end
end
