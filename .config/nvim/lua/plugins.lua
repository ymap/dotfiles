return {
  {
    'sainnhe/sonokai',
    config = function()
      vim.g.sonokai_style = 'espresso'
      vim.cmd.colorscheme("sonokai")
    end,
    priority = 1000,
  },
  { 'rcarriga/nvim-notify' },
  { 'kana/vim-textobj-user' },
  { 'rickhowe/diffchar.vim' },
  { 'tpope/vim-projectionist' },
  { 'akinsho/git-conflict.nvim' },
  { 'MunifTanjim/nui.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  { 'vim-jp/vimdoc-ja' },
  { 'vim-ruby/vim-ruby' },
  { 'tpope/vim-rsi' },
  { 'mhinz/neovim-remote' },
  { 'rhysd/git-messenger.vim' },
  { 'tpope/vim-abolish' },
  { 'delphinus/vim-auto-cursorline' },
  { 'vim-denops/denops.vim' },
  { 'Darazaki/indent-o-matic' },
  {
    'rbtnn/vim-ambiwidth',
    lazy = false,
    config = function()
      -- Adjust cell width for glyph  (0xe0b2) by removing relevant entries
      local cellwidths = vim.fn.getcellwidths()

      for i, v in ipairs(cellwidths) do
        if v[1] <= 0xe0b2 and v[2] >= 0xe0b2 then
          table.remove(cellwidths, i)
        end
      end

      vim.fn.setcellwidths(cellwidths)
    end
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      handler_options = {
        select_for_search = false,
      }
    },
    submodules = false,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      local npairs = require('nvim-autopairs')

      npairs.setup()
      local surround = function(a1, ins, a2, lang)
        npairs.add_rule(
          rule(ins, ins, lang)
          :with_pair(function(opts) return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1) end)
          :with_move(cond.none())
          :with_cr(cond.none())
          :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            return a1 .. ins .. ins .. a2 ==
                opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
          end)
        )
      end
      surround('(', ' ', ')')
      surround('{', ' ', '}')
      surround('[', ' ', ']')
    end,
  },
  {
    "utilyre/sentiment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    'nacro90/numb.nvim',
    event = "CmdlineEnter",
    opts = {},
  },
  {
    'stevearc/oil.nvim',
    event = "BufReadPre",
    keys = {
      { "<C-e>", "<Cmd>Oil --float<CR>" },
    },
    opts = {
      default_file_explorer = true,
      keymaps = {
        ["<C-e>"] = "actions.close",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'karb94/neoscroll.nvim',
    keys = {
      { '<C-b>', function() require("neoscroll").ctrl_b({ duration = 100 }) end, silent = true, noremap = true },
      { '<C-f>', function() require("neoscroll").ctrl_f({ duration = 100 }) end, silent = true, noremap = true },
      { '<C-u>', function() require("neoscroll").ctrl_u({ duration = 100 }) end, silent = true, noremap = true },
      { '<C-d>', function() require("neoscroll").ctrl_d({ duration = 100 }) end, silent = true, noremap = true },
    }
  },
  {
    'mfussenegger/nvim-dap',
    keys = {
      { '<F5>', function() require('dap').toggle_breakpoint() end, silent = true, noremap = true }
    }
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'olimorris/neotest-rspec',
    },
    keys = {
      { '<leader>tw', function() require("neotest").watch.toggle() end,                silent = true, noremap = true },
      { '<leader>tm', function() require("neotest").run.run() end,                     silent = true, noremap = true },
      { '<leader>ta', function() require("neotest").run.run(vim.fn.expand("%")) end,   silent = true, noremap = true },
      { '<leader>tl', function() require("neotest").run.run_last() end,                silent = true, noremap = true },
      { '<leader>to', function() require("neotest").output.open({ enter = true }) end, silent = true, noremap = true },
      { '<leader>To', function() require("neotest").output_panel.toggle() end,         silent = true, noremap = true },
      { '<leader>ts', function() require("neotest").summary.toggle() end,              silent = true, noremap = true },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function() return "bin/rspec" end
          }),
        },
        output = {
          open_on_run = true,
        },
        output_panel = {
          open = "vsplit"
        },
      })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      numhl = true
    },
  },
  {
    'folke/trouble.nvim',
    keys = {
      { '<leader>x', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', silent = true, noremap = true },
      { '<leader>X', '<cmd>Trouble diagnostics toggle<CR>',              silent = true, noremap = true },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      focus = true,
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    },
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ghq.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    keys = {
      { '<leader>ff',  ':Telescope find_files hidden=true<CR>',                                         silent = true, noremap = true },
      { '<leader>gl',  ':Telescope live_grep<CR>',                                                      silent = true, noremap = true },
      { '<leader>gg',  ':Telescope grep_string<CR>',                                                    silent = true, noremap = true },
      { '<leader>bb',  ':Telescope buffers<CR>',                                                        silent = true, noremap = true },
      { '<leader>v',   ':Telescope find_files cwd=~/.config/nvim<CR>',                                  silent = true, noremap = true },
      { '<leader>h',   ':Telescope help_tags<CR>',                                                      silent = true, noremap = true },
      { '<leader>gh',  ':Telescope ghq<CR>',                                                            silent = true, noremap = true },
      { '<leader>gc',  ':Telescope git_commits<CR>',                                                    silent = true, noremap = true },
      { '<leader>gs',  ':Telescope git_status<CR>',                                                     silent = true, noremap = true },
      { '<leader>gb',  ':Telescope git_branches<CR>',                                                   silent = true, noremap = true },
      { '<leader>jk',  ':vs ~/.cache/junkfile/kaizen.md<CR>',                                           silent = true, noremap = true },
      { '<leader>jt',  ':vs ~/.cache/junkfile/todo.md<CR>',                                             silent = true, noremap = true },
      { '<leader>jm',  ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.md"))<CR>',   silent = true, noremap = true },
      { '<leader>jr',  ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.rb"))<CR>',   silent = true, noremap = true },
      { '<leader>jsq', ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.sql"))<CR>',  silent = true, noremap = true },
      { '<leader>jsh', ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.bash"))<CR>', silent = true, noremap = true },
      { '<leader>jv',  ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.vim"))<CR>',  silent = true, noremap = true },
      { '<leader>jjs', ':<C-u>call execute(strftime("vs ~/.cache/junkfile/%Y-%m-%d-%H%M%S.js"))<CR>',   silent = true, noremap = true },
      {
        '<leader>jl',
        function()
          require("telescope.builtin")
              .find_files(
                {
                  cwd = '~/.cache/junkfile',
                  find_command = { "rg", "--files", "--sortr=modified" },
                }
              )
        end,
        silent = true,
        noremap = true
      },
    },
    config = function()
      local ts = require('telescope')
      ts.setup({
        defaults = {
          sorting_strategy = "ascending",
          mappings = {
            n = {
              ["<C-c>"] = "close",
            },
            i = {
              ["<C-o>"] = { "<esc>", type = "command" },
              ["<C-u>"] = false,
            },
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          }
        }
      })

      ts.load_extension('fzf')
    end
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      format_after_save = { lsp_fallback = true },
    },
  },
  {
    -- 'hrsh7th/nvim-cmp',
    'xzbdmw/nvim-cmp',
    branch = 'dynamic',
    dependencies = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'dmitmel/cmp-cmdline-history',
      'bydlw98/cmp-env',
      'rasulomaroff/cmp-bufname',
      'hrsh7th/cmp-path',
      {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        config = function()
          local tabnine = require("cmp_tabnine.config")
          tabnine:setup({
            max_num_results = 2
          })
        end
      },
      {
        'petertriho/cmp-git',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("cmp_git").setup() end,
      },
      {
        'zbirenbaum/copilot-cmp',
        after = { "copilot.lua" },
        config = function()
          require('copilot_cmp').setup()
        end
      },
      {
        'wxxxcxx/cmp-browser-source',
        config = function() require('cmp-browser-source').start_server() end,
      },
      { 'uga-rosa/cmp-skkeleton', dependencies = { 'skkeleton' } },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = vim.schedule_wrap(
            function(fallback)
              if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              else
                fallback()
              end
            end
          )
        }),
        sources = cmp.config.sources(
          {
            { name = 'skkeleton' },
            { name = 'calc' },
          },
          {
            { name = 'env' },
            { name = 'copilot' },
            { name = 'cmp_tabnine' },
            { name = 'nvim_lsp' },
          },
          {
            { name = 'buffer', keyword_length = 3 },
            { name = 'bufname' },
            { name = 'browser' },
          }
        ),
        formatting = {
          format = lspkind.cmp_format({
            symbol_map = { Copilot = "" }
          })
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
            require('cmp_tabnine.compare'),
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = true,
        },
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources(
          { { name = 'git' } },
          { { name = 'buffer' } }
        )
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path',   option = { trailing_slash = true, label_trailing_slash = true } },
            { name = 'cmdline' },
          },
          {
            { name = 'cmdline_history' },
          }
        ),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  },
  {
    'j-hui/fidget.nvim',
    config = function() require('fidget').setup({}) end
  },
  {
    'echasnovski/mini.animate',
    opts = function()
      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          enable = false,
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    opts = {
      suggestion = { enabled = false, },
      panel = { enabled = false, },
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      vim.filetype.add {
        pattern = {
          ['.*/openapi/.*%.ya?ml'] = 'yaml.openapi',
          ['.*/openapi/.*%.json'] = 'json.openapi',
        },
      }

      lspconfig.vacuum.setup({
        settings = {
          filetype = "openapi"
        }
      })

      lspconfig.tsserver.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vim.fn.expand("$HOME/node_modules/@vue/typescript-plugin"),
            },
          },
        },
      })

      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
            },
          },
        }
      })

      lspconfig.sorbet.setup({ cmd = { 'bin/srb', 'tc', '--lsp' } })
      lspconfig.rubocop.setup({
        cmd = { 'bin/rubocop', '--lsp' },
        root_dir = lspconfig.util.root_pattern({ 'sorbet' }),
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "yamlls", "vacuum", "tsserver" },
        automatic_installation = { exclude = { "sorbet", "rubocop", "solargraph" } },
      })
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    keys = {
      { '<leader>a', ':Lspsaga code_action<CR>',     silent = true, noremap = true },
      { '<leader>o', ':Lspsaga outline<CR>',         silent = true, noremap = true },
      { 'gd',        ':Lspsaga goto_definition<CR>', silent = true, noremap = true },
      { 'gr',        ':Lspsaga finder<CR>',          silent = true, noremap = true },
      { 'gn',        ':Lspsaga rename<CR>',          silent = true, noremap = true },
      { 'K',         ':Lspsaga hover_doc<CR>',       silent = true, noremap = true },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      diagnostic = {
        max_height = 0.8,
        keys = {
          quit = { 'q', '<ESC>' }
        }
      },
      code_action = {
        show_server_name = true,
        extend_gitsigns = true,
      },
      lightbulb = {
        sign = false,
      },
    },
  },
  {
    'mhinz/vim-startify',
    config = function()
      vim.g.startify_disable_at_vimenter = 0
      vim.g.startify_custom_header = vim.fn['startify#center'](
        vim.fn['startify#fortune#boxed'](
          vim.fn.readfile(vim.fn.fnamemodify("~/.cache/junkfile/kaizen.md", ":p"))
        )
      )
      vim.g.startify_list_order = { 'sessions' }
      vim.g.startify_session_persistence = 1
      vim.g.startify_custom_indices = { 's' }
      vim.api.nvim_create_autocmd(
        'User',
        {
          pattern = 'Startified',
          callback = function() vim.bo.buflisted = true end,
        }
      )
    end,
  },
  {
    'machakann/vim-sandwich',
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1
      vim.g.operator_sandwich_no_default_key_mappings = 1
      vim.g.textobj_sandwich_no_default_key_mappings = 1
    end,
    config = function()
      vim.cmd.runtime("macros/sandwich/keymap/surround.vim")
    end,
  },
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_ruby_options_as_arguments = 1
    end
  },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'mechatroner/rainbow_csv',
    ft = 'csv',
  },
  {
    'cespare/vim-toml',
    ft = 'toml',
  },
  {
    'romgrk/barbar.nvim',
    event = 'VimEnter',
    dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons' },
    keys = {
      { 'gt',  '<Cmd>BufferNext<CR>',         silent = true, noremap = true },
      { 'gT',  '<Cmd>BufferPrevious<CR>',     silent = true, noremap = true },
      { 'gmt', '<Cmd>BufferMoveNext<CR>',     silent = true, noremap = true },
      { 'gmT', '<Cmd>BufferMovePrevious<CR>', silent = true, noremap = true },
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
  },
  {
    'dgsuarez/reruby.vim',
    ft = 'ruby',
  },
  {
    'hashivim/vim-terraform',
    ft = 'tf',
  },
  {
    'elzr/vim-json',
    ft = 'json',
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
  {
    'rcmdnk/vim-markdown',
    ft = 'markdown',
    config = function()
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_no_default_key_mappings = 1
    end,
  },
  {
    'famiu/bufdelete.nvim',
    keys = {
      { '<Leader>d', function() require('bufdelete').bufdelete(0, true) end, silent = true, noremap = true },
    },
  },
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { 'U', ':<C-u>UndotreeToggle<CR>', silent = true, noremap = true },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  {
    'tpope/vim-rails',
    ft = { 'ruby', 'eruby' },
  },
  {
    'tpope/vim-dispatch',
    config = function()
      vim.g.dispatch_no_maps = 1
      vim.g.dispatch_no_tmux_make = 1
    end,
  },
  {
    'janko/vim-test',
    dependencies = 'vim-dispatch',
    keys = {
      { '<leader>Ta', ':TestFile -strategy=neovim<CR>',    silent = true },
      { '<leader>Tl', ':TestLast -strategy=neovim<CR>',    silent = true },
      { '<leader>Tm', ':TestNearest -strategy=neovim<CR>', silent = true },
    },
    config = function()
      vim.g['test#neovim#term_position'] = 'vert 30'
    end,
  },
  {
    'tek/vim-textobj-ruby',
    ft = { 'ruby', 'eruby' },
  },
  {
    'kana/vim-textobj-entire',
    keys = {
      { 'ae', '<Plug>(textobj-entire-a)', mode = { 'o', 'v' }, silent = true },
      { 'ie', '<Plug>(textobj-entire-i)', mode = { 'o', 'v' }, silent = true },
    },
    dependencies = 'kana/vim-textobj-user',
    config = function()
      vim.g.textobj_entire_no_default_key_mappings = 1
    end,
  },
  {
    'kana/vim-textobj-line',
    keys = {
      { 'al', '<Plug>(textobj-line-a)', mode = { 'o', 'v' }, silent = true },
      { 'il', '<Plug>(textobj-line-i)', mode = { 'o', 'v' }, silent = true },
    },
    dependencies = 'kana/vim-textobj-user',
    config = function()
      vim.g.textobj_line_no_default_key_mappings = 1
    end,
  },
  {
    'deris/vim-shot-f',
    keys = { 'f', 'F', 't', 'T' },
  },
  {
    'vim-scripts/dbext.vim',
    event = 'InsertEnter',
  },
  {
    'AndrewRadev/sideways.vim',
    keys = {
      { '>,', ':SidewaysRight<CR>', silent = true, noremap = true },
      { '<,', ':SidewaysLeft<CR>',  silent = true, noremap = true },
    },
  },
  {
    'vim-skk/skkeleton',
    dependencies = { 'vim-denops/denops.vim', 'shg-eo/skkeleton-azik' },
    config = function()
      vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Plug>(skkeleton-toggle)')
      vim.fn['skkeleton#register_keymap']('input', ';', 'henkanPoint')
      vim.fn['skkeleton#register_keymap']('input', '@', 'katakana')
      vim.fn['skkeleton#register_kanatable']('rom', { [':'] = { 'っ' } })
      vim.fn['skkeleton#config'](
        {
          globalDictionaries = { '~/.config/skk/SKK-JISYO.L' },
          eggLikeNewline = true,
        }
      )
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { 'RRethy/nvim-treesitter-endwise' },
    build = ':TSUpdate',
    opts = {
      auto_install = true,
      indent = { enable = false },
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
      endwise = { enable = true },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      always_trigger = true
    }
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { '<leader><CR>', '<Plug>MarkdownPreviewToggle', ft = 'markdown', silent = true },
    },
    ft = 'markdown',
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    'dense-analysis/ale',
    event = 'BufWritePre',
    config = function()
      vim.g.ale_linters = {
        ruby = { 'packwerk' },
        typescript = {},
        vim = {},
        gitcommit = {},
        markdown = {},
        yaml = {},
      }
      vim.g.ale_fixers = {
        typescript = { 'eslint' },
        ruby = {},
        sql = { 'sqlformat' },
        gitcommit = { 'gitlint' },
        markdown = { 'remark-lint' },
        yaml = {},
      }
      vim.g.ale_ruby_packwerk_executable = 'bin/packwerk'
      vim.g.ale_ruby_reek_executable = 'bin/reek'
      vim.g.ale_echo_cursor = 0
      vim.g.ale_hover_to_floating_preview = 0
      vim.g.ale_sql_sqlformat_options = ''
      vim.g.ale_markdown_remark_lint_options = '--rc-path=$HOME/.config/remark-lint/.remarkrc.yml'
      vim.g.ale_fix_on_save = 1
    end,
  },
  {
    'tpope/vim-dadbod',
    cmd = 'DB',
    dependencies = 'vim-dispatch',
    config = function()
      vim.g.omni_sql_no_default_maps = 1
    end,
  },
  {
    'napisani/nvim-dadbod-bg',
    dependencies = 'vim-dadbod',
    build = './install.sh',
    keys = {
      { '<leader><CR>', ':!open http://localhost:4546<CR>', ft = { 'dbui', 'dbout' }, silent = true, noremap = true },
    },
    config = function()
      vim.g.nvim_dadbod_bg_port = 4546
      vim.g.nvim_dadbod_bg_log_file = '~/.cache/nvim-dadbod-bg.log'
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = 'vim-dadbod',
    cmd = { 'DBUI', 'DBUIToggle' },
    keys = {
      { '<leader>u', ':DBUIToggle<CR>', silent = true, noremap = true },
    },
    config = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_table_helpers = {
        mysql = {
          CreateTable = 'SHOW CREATE TABLE {optional_schema}{table}',
        },
      }
    end,
  },
  {
    'pbogut/vim-dadbod-ssh',
    dependencies = 'vim-dadbod',
    config = function()
      vim.g.db_adapter_ssh_timeout = 700
    end,
  },
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    cmd = "SnipRun",
    keys = {
      { '<leader>r',    '<Plug>SnipRunOperator',                    mode = 'n', silent = true },
      { '<leader>r',    ':SnipRun<CR>',                             mode = 'v', silent = true },
      { '<leader><CR>', function() require("sniprun").run('v') end, mode = 'v', silent = true, noremap = true },
    },
    config = function()
      require("sniprun").setup({
        display = { "NvimNotify" }
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    keys = {
      {
        '<leader>e',
        function()
          vim.cmd('normal! vip'); require("avante.api").edit()
        end,
        mode = { "n" },
        silent = true,
        noremap = true
      },
      { '<leader>e', function() require("avante.api").edit() end, mode = { "v" }, silent = true, noremap = true },
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      provider = "openai",
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "o3-mini",
        timeout = 30000,
        temperature = 0,
      },
      windows = {
        position = "left",
        wrap = true,
      },
      system_prompt = "Always respond in Japanese!"
    },
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "MCPHub",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        port = 3030,
        config = vim.fn.expand("~/.config/mcpservers.json"),
        on_ready = function(hub) end,
        on_error = function(err) end,
        log = {
          level = vim.log.levels.WARN,
          to_file = false,
          file_path = nil,
          prefix = "MCPHub"
        },
      })
    end
  }
}
