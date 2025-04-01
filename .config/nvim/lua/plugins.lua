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
      local actions_layout = require("telescope.actions.layout")
      ts.setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            flip_columns = 120,
            vertical = {
              preview_cutoff = 20,
            },
            scroll_speed = 10,
          },
          sorting_strategy = "ascending",
          mappings = {
            n = {
              ["<C-c>"] = "close",
              ["<C-p>"] = function(...) return actions_layout.toggle_preview(...) end,
              ['<C-u>'] = "results_scrolling_up",
              ['<C-d>'] = "results_scrolling_down",
              ['<C-b>'] = "preview_scrolling_up",
              ['<C-f>'] = "preview_scrolling_down",
            },
            i = {
              ["<C-o>"] = { "<esc>", type = "command" },
              ["<C-u>"] = false,
              ['<C-b>'] = "preview_scrolling_up",
              ['<C-f>'] = "preview_scrolling_down",
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })

      ts.load_extension('fzf')
    end
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      { '<leader>fo', function() require('conform').format() end, silent = true, noremap = true }
    },
    cmd = "ConformInfo",
    opts = {
      formatters = {
        sql_formatter = {
          command = 'sql-formatter',
          args = {
            '--config',
            vim.fn.expand('~/.config/sql-formatter/.sql-formatter.json')
          }
        }
      },
      formatters_by_ft = {
        sql = { "sql_formatter" },
        mysql = { "sql_formatter" },
      },
      format_after_save = function(bufnr)
        local ignore_filetypes = { 'sql', 'mysql' }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
  {
    'saghen/blink.cmp',
    version = '*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      "xzbdmw/colorful-menu.nvim",
      "fang2hou/blink-copilot",
      "Kaiser-Yang/blink-cmp-git",
      "disrupted/blink-cmp-conventional-commits",
      "Kaiser-Yang/blink-cmp-avante",
      "moyiz/blink-emoji.nvim",
      { "saghen/blink.compat",    version = '*' },
      { "tzachar/cmp-tabnine",    build = './install.sh' },
      { 'uga-rosa/cmp-skkeleton', dependencies = { 'skkeleton' } },
    },
    opts = {
      sources = {
        default = {
          'avante',
          'emoji',
          'skkeleton',
          'copilot',
          'cmp_tabnine',
          'snippets',
          'lsp',
        },
        per_filetype = {
          sql = { 'dadbod', 'copilot', 'cmp_tabnine' },
          mysql = { 'dadbod', 'copilot', 'cmp_tabnine' },
          gitcommit = { 'conventional_commits', 'git', 'copilot', 'cmp_tabnine', 'path' },
          AvanteInput = { 'avante', 'skkeleton', 'copilot', 'cmp_tabnine', 'path', 'buffer' }
        },
        providers = {
          skkeleton = {
            name = "skkeleton",
            module = 'blink.compat.source',
            score_offset = 100,
            async = true,
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          cmp_tabnine = {
            name = "cmp_tabnine",
            module = 'blink.compat.source',
            score_offset = 100,
            max_items = 2,
            async = true,
            opts = {
              run_on_every_keystroke = true,
            }
          },
          lsp = {
            name = "lsp",
            module = "blink.cmp.sources.lsp",
            async = true,
            fallbacks = { 'path', 'buffer' }
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
            async = true,
          },
          git = {
            name = 'Git',
            module = 'blink-cmp-git',
            async = true,
          },
          conventional_commits = {
            name = 'Conventional Commits',
            module = 'blink-cmp-conventional-commits',
            async = true,
          },
          emoji = {
            name = "emoji",
            module = "blink-emoji",
          },
          avante = {
            name = 'Avante',
            module = 'blink-cmp-avante',
            async = true,
          },
        }
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },
        menu = {
          draw = {
            columns = { { "label", gap = 1 }, { "kind_icon", "kind" } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
          border = 'rounded',
        },
        ghost_text = { enabled = true },
      },
      keymap = {
        preset = 'super-tab',
        ['<CR>'] = { 'accept', 'fallback' },
      },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
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
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              diagnostics = { globals = { 'vim' } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
        vacuum = {
          settings = {
            vacuum = {
              filetypes = { "openapi" },
            },
          },
        },
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.expand("$HOME/node_modules/@vue/typescript-plugin"),
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
              },
            },
          }
        },
        sorbet = {
          cmd = { 'bundle', 'exec', 'srb', 'tc', '--lsp' }
        },
        rubocop = {
          cmd = { 'bundle', 'exec', 'rubocop', '--lsp' }
        }
      }
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.filetype.add {
        pattern = {
          ['.*/openapi/.*%.ya?ml'] = 'yaml.openapi',
          ['.*/openapi/.*%.json'] = 'json.openapi',
        },
      }
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "yamlls", "vacuum", "ts_ls" },
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
    'jiaoshijie/undotree',
    event = 'VeryLazy',
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { 'U', function() require('undotree').toggle() end, silent = true, noremap = true },
    },
    config = function()
      require('undotree').setup({
        window = { winblend = 20 },
      })
    end,
  },
  {
    'tpope/vim-rails',
    event = 'VeryLazy',
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
      vim.fn['skkeleton#register_keymap']('input', '<C-;>', 'henkanPoint')
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
        markdown = {},
        yaml = {},
      }
      vim.g.ale_fixers = {
        typescript = { 'eslint' },
        ruby = {},
        sql = { 'sqlformat' },
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
    dependencies = {
      'vim-dadbod',
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } }
    },
    cmd = { 'DBUI', 'DBUIToggle' },
    keys = {
      { '<leader>u', ':DBUIToggle<CR>', silent = true, noremap = true },
    },
    init = function()
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_force_echo_notifications = 0
      vim.g.db_ui_disable_progress_bar = 1
    end,
    config = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
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
  },
  {
    "nekowasabi/aider.vim",
    dependencies = "vim-denops/denops.vim",
    event = 'VeryLazy',
    keys = {
      { '<leader>Ar', ':AiderRun<CR>',                          silent = true, noremap = true },
      { '<leader>Ab', ':AiderSilentAddCurrentFile<CR>',         silent = true, noremap = true },
      { '<leader>AB', ':AiderSilentAddCurrentFileReadOnly<CR>', silent = true, noremap = true },
      { '<leader>Aa', ':AiderAddBuffers<CR>',                   silent = true, noremap = true },
      { '<leader>Ae', ':AiderVisualTextWithPrompt<CR>',         silent = true, noremap = true, mode = { 'v' } },
      { '<leader>Aw', ':AiderAddWeb<CR>',                       silent = true, noremap = true },
      { '<leader>Aq', ':AiderExit<CR>',                         silent = true, noremap = true },
      { '<leader>Ah', ':AiderHide<CR>',                         silent = true, noremap = true },
      { '<leader>Av', ':AiderVoice<CR>',                        silent = true, noremap = true },
    },
    config = function()
      vim.g.aider_command = 'aider --architect --model o3-mini --reasoning-effort high --no-auto-commits --no-gitignore'
      vim.g.aider_buffer_open_type = 'floating'
      vim.g.aider_floatwin_width = 100
      vim.g.aider_floatwin_height = 20

      vim.api.nvim_create_autocmd(
        'User',
        {
          pattern = 'AiderOpen',
          callback = function(args)
            vim.keymap.set('n', 'q', '<cmd>AiderHide<CR>', { buffer = args.buf })
            vim.keymap.set('n', '<C-c>', '<cmd>AiderHide<CR>', { buffer = args.buf })
            vim.keymap.set('t', '<C-c>', '<cmd>AiderHide<CR>', { buffer = args.buf })
            vim.keymap.set('t', '<C-d>', '<cmd>AiderHide<CR>', { buffer = args.buf })
          end
        }
      )
    end
  }
}
