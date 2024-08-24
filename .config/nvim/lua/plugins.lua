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
  { 'rhysd/conflict-marker.vim' },
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
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>cm",  "<CMD>CopilotChatCommit<CR>" },
      { "<leader>cc",  "<CMD>CopilotChatToggle<CR>",       mode = { "n", "v" } },
      { "<leader>cdo", "<CMD>CopilotChatDoc<CR>",          mode = { "n", "v" } },
      { "<leader>cdi", "<CMD>CopilotChatFixDiagnostic<CR>" },
      { "<leader>ce",  "<CMD>CopilotChatExplain<CR>",      mode = { "n", "v" } },
      { "<leader>cf",  "<CMD>CopilotChatFix<CR>",          mode = { "n", "v" } },
      { "<leader>co",  "<CMD>CopilotChatOptimize<CR>",     mode = { "n", "v" } },
      { "<leader>cr",  "<CMD>CopilotChatReview<CR>",       mode = { "n", "v" } },
      { "<leader>cs",  "<CMD>CopilotChatStop<CR>" },
    },
    config = function()
      local prompts = require('CopilotChat.prompts')

      require("CopilotChat").setup(
        {
          system_prompt = prompts.COPILOT_INSTRUCTIONS .. "\nYou MUST respond in Japanese.",
          window = {
            layout = 'float',
            relative = 'win',
            width = 0.5,
            height = 0.8,
            row = 2,
            col = 60,
            border = 'rounded',
          },
          mappings = {
            complete = {
              detail = 'Use @<Tab> or /<Tab> for options.',
              insert = '<Tab>',
            },
            close = {
              normal = '<C-c>',
              insert = '<NOP>'
            },
            reset = {
              insert = '<C-l>'
            },
            submit_prompt = {
              normal = '<CR>',
              insert = '<C-m>'
            },
            accept_diff = {
              normal = '<C-y>',
              insert = '<C-y>'
            },
            yank_diff = {
              normal = 'gy',
            },
            show_diff = {
              normal = 'gd'
            },
            show_system_prompt = {
              normal = 'gp'
            },
            show_user_selection = {
              normal = 'gs'
            },
          },
        }
      )
    end,
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
    config = function()
      require("neoscroll").setup({
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>' },
      })
      require("neoscroll.config").set_mappings({
        ["<C-b>"] = { "scroll", { -vim.api.nvim_win_get_height(0), "true", "100" } },
        ["<C-f>"] = { "scroll", { vim.api.nvim_win_get_height(0), "true", "100" } },
        ["<C-u>"] = { "scroll", { -vim.wo.scroll, "true", "100" } },
        ["<C-d>"] = { "scroll", { vim.wo.scroll, "true", "100" } },
      })
    end
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
      { '<leader>Tm', function() require("neotest").run.run({ strategy = "dap" }) end, silent = true, noremap = true },
      { '<leader>ta', function() require("neotest").run.run(vim.fn.expand("%")) end,   silent = true, noremap = true },
      { '<leader>tl', function() require("neotest").run.run_last() end,                silent = true, noremap = true },
      { '<leader>to', ':Neotest output-panel<CR>',                                     silent = true, noremap = true },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            rspec_cmd = function() return "bin/rspec" end
          }),
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
    config = function(_, opts)
      vim.fn.setcellwidths({ { 0xe0b2, 0xe0b3, 1 } })
      require("lualine").setup(opts)
    end,
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
      { '<leader>ff', ':Telescope find_files hidden=true<CR>',        silent = true, noremap = true },
      { '<leader>gl', ':Telescope live_grep<CR>',                     silent = true, noremap = true },
      { '<leader>gg', ':Telescope grep_string<CR>',                   silent = true, noremap = true },
      { '<leader>bb', ':Telescope buffers<CR>',                       silent = true, noremap = true },
      { '<leader>v',  ':Telescope find_files cwd=~/.config/nvim<CR>', silent = true, noremap = true },
      { '<leader>h',  ':Telescope help_tags<CR>',                     silent = true, noremap = true },
      { '<leader>gh', ':Telescope ghq<CR>',                           silent = true, noremap = true },
      { '<leader>gc', ':Telescope git_commits<CR>',                   silent = true, noremap = true },
      { '<leader>gs', ':Telescope git_status<CR>',                    silent = true, noremap = true },
      { '<leader>gb', ':Telescope git_branches<CR>',                  silent = true, noremap = true },
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
    'jackMort/ChatGPT.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader><leader>', '<Cmd>ChatGPT<CR>',                     mode = { "n", "v" }, silent = true, noremap = true },
      { '<leader>E',        '<Cmd>ChatGPTEditWithInstructions<CR>', mode = { "n", "v" }, silent = true, noremap = true },
      {
        '<leader>e',
        function()
          function OpeChatGPTEdit() require("chatgpt").edit_with_instructions() end

          vim.o.operatorfunc = "v:lua.OpeChatGPTEdit"
          vim.api.nvim_feedkeys("g@", "n", false)
        end,
        mode = { "n", "v" },
        silent = true,
        noremap = true,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd(
        "Filetype",
        {
          pattern = "chatgpt-input",
          callback = function()
            vim.keymap.set("i", "<C-c>", "<C-c>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-d>", "<C-d>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-h>", "<C-h>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-i>", "<C-i>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-k>", "<C-k>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-p>", "<C-p>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-r>", "<C-r>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-s>", "<C-s>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-u>", "<C-u>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<C-y>", "<C-y>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<Tab>", "<Tab>", { noremap = true, silent = true, buffer = 0 })
            vim.keymap.set("i", "<CR>", "<ESC><CR>", { noremap = true, silent = true, buffer = 0 })
          end
        }
      )
      require('chatgpt').setup({
        api_key_cmd = nil,
        yank_register = "+",
        edit_with_instructions = {
          diff = true,
          keymaps = {
            -- close = { "<ESC>" },
            accept = "<C-y>",
            toggle_diff = "<C-d>",
            toggle_settings = "<C-o>",
            toggle_help = "?",
            cycle_windows = "<Tab>",
            use_output_as_input = "<C-i>",
          },
        },
        chat = {
          welcome_message = WELCOME_MESSAGE,
          loading_text = "Loading, please wait ...",
          question_sign = "", -- 🙂
          answer_sign = "ﮧ", -- 🤖
          border_left_sign = "",
          border_right_sign = "",
          max_line_length = 120,
          sessions_window = {
            active_sign = "  ",
            inactive_sign = "  ",
            current_line_sign = "",
            border = {
              style = "rounded",
              text = {
                top = " Sessions ",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
          },
          keymaps = {
            close = "<C-c>",
            yank_last = "<C-y>",
            yank_last_code = "<C-k>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
            cycle_modes = "<C-f>",
            next_message = "<C-j>",
            prev_message = "<C-k>",
            select_session = "<Space>",
            rename_session = "r",
            delete_session = "d",
            draft_message = "<C-r>",
            edit_message = "e",
            delete_message = "d",
            toggle_settings = "<C-o>",
            toggle_sessions = "<C-p>",
            toggle_help = "<C-h>",
            toggle_message_role = "<C-r>",
            toggle_system_role_open = "<C-s>",
            stop_generating = "<C-x>",
          },
        },
        popup_layout = {
          default = "center",
          center = {
            width = "80%",
            height = "80%",
          },
          right = {
            width = "30%",
            width_settings_open = "50%",
          },
        },
        popup_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " ChatGPT ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = "1",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
          buf_options = {
            filetype = "markdown",
          },
        },
        system_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " SYSTEM ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
            foldcolumn = "2",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        popup_input = {
          prompt = "  ",
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top_align = "center",
              top = " Prompt ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
          submit = "<C-Enter>",
          submit_n = "<Enter>",
          max_visible_lines = 20,
        },
        settings_window = {
          setting_sign = "  ",
          border = {
            style = "rounded",
            text = {
              top = " Settings ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        help_window = {
          setting_sign = "  ",
          border = {
            style = "rounded",
            text = {
              top = " Help ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        openai_params = {
          model = "gpt-4o",
          max_tokens = 2048,
        },
        openai_edit_params = {
          model = "gpt-4o",
          max_tokens = 2048,
        },
        use_openai_functions_for_edits = false,
        actions_paths = {},
        show_quickfixes_cmd = "Trouble quickfix",
        predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
        highlights = {
          help_key = "@symbol",
          help_description = "@comment",
        },
      })
    end,
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
    'Shougo/denite.nvim',
    cmd = 'Denite',
    keys = {
      { '<CR>',    'denite#do_map("do_action")',            ft = 'denite',        silent = true,        noremap = true, expr = true },
      { 'a',       'denite#do_map("do_action", "add")',     ft = 'denite',        silent = true,        noremap = true, expr = true },
      { 'p',       'denite#do_map("do_action", "preview")', ft = 'denite',        silent = true,        noremap = true, expr = true },
      { 'q',       'denite#do_map("quit")',                 ft = 'denite',        silent = true,        noremap = true, expr = true },
      { '<C-c>',   'denite#do_map("quit")',                 ft = 'denite',        silent = true,        noremap = true, expr = true },
      { 'i',       'denite#do_map("open_filter_buffer")',   ft = 'denite',        silent = true,        noremap = true, expr = true },
      { '<Space>', 'denite#do_map("toggle_select")."j"',    ft = 'denite',        silent = true,        noremap = true, expr = true },
      { '<C-c>',   '<Plug>(denite_filter_update)',          ft = 'denite-filter', silent = true },
      { '<C-o>',   '<Plug>(denite_filter_update)',          mode = 'i',           ft = 'denite-filter', silent = true },
    },
    config = function()
      vim.fn['denite#custom#option']('_', 'root_markers', '.projections.json')
      vim.fn['denite#custom#option']('_', 'highlight_matched_range', 'None')
      vim.fn['denite#custom#option']('_', 'highlight_matched_char', 'None')
      vim.fn['denite#custom#option']('_', 'start_filter', true)
      vim.fn['denite#custom#option']('_', {
        highlight_filter_background = 'CursorLine',
        highlight_matched_char = 'Search',
        source_names = 'short',
        split = 'floating',
      })
    end,
  },
  {
    'Shougo/junkfile.vim',
    commit = 'f1bb37d152edb087dae42c68466b95fc2c9fc9d8',
    dependencies = 'denite.nvim',
    keys = {
      { '<leader>jk',  ':<C-u>call junkfile#init()<CR>:execute("vs " . g:junkfile#directory . "/kaizen.md")<CR>', silent = true, noremap = true },
      { '<leader>jm',  ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.md"))<CR>',                silent = true, noremap = true },
      { '<leader>jr',  ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.rb"))<CR>',                silent = true, noremap = true },
      { '<leader>jsq', ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.sql"))<CR>',               silent = true, noremap = true },
      { '<leader>jsh', ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.bash"))<CR>',              silent = true, noremap = true },
      { '<leader>jv',  ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.vim"))<CR>',               silent = true, noremap = true },
      { '<leader>jjs', ':<C-u>call junkfile#open_immediately(strftime("%Y-%m-%d-%H%M%S.js"))<CR>',                silent = true, noremap = true },
      { '<leader>jl',  ':<C-u>Denite junkfile junkfile:new<CR>',                                                  silent = true, noremap = true },
    }
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
}
