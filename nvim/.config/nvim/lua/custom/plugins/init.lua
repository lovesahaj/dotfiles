-- You can add your own plugins here or in other files in this directory!
return {
  {
    'mfussenegger/nvim-dap-python',
  },
  { 'jay-babu/mason-nvim-dap.nvim' },

  {
    'mfussenegger/nvim-dap',
    lazy = true,
  },
  {
    'pteroctopus/faster.nvim',
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        silent = true,
      },
    },
    opts = {
      mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
      },
      layouts = {
        {
          elements = {
            { id = 'repl', size = 0.30 },
            { id = 'console', size = 0.70 },
          },
          size = 0.19,
          position = 'bottom',
        },
        {
          elements = {
            { id = 'scopes', size = 0.30 },
            { id = 'breakpoints', size = 0.20 },
            { id = 'stacks', size = 0.10 },
            { id = 'watches', size = 0.30 },
          },
          size = 0.20,
          position = 'right',
        },
      },
      controls = {
        enabled = true,
        element = 'repl',
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = vim.g.border_chars,
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
    },
    config = function(_, opts)
      require('dapui').setup(opts)
    end,
  },

  -- Test Runner
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',

      -- Language adapters
      'nvim-neotest/neotest-python',
      'rouge8/neotest-rust',
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
            runner = 'pytest',
          },
          require 'neotest-rust' {
            args = { '--no-capture' },
          },
          require 'neotest-go' {
            experimental = { test_table = true },
            args = { '-v', '-race', '-count=1' },
          },
          require 'neotest-jest' {
            jestCommand = 'npm test --',
          },
          require 'neotest-vitest',
        },
        discovery = {
          enabled = true,
        },
        running = {
          concurrent = true,
        },
        summary = {
          open = 'botright vsplit | vertical resize 50',
        },
      }
    end,
    keys = {
      {
        '<leader>Tt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '[T]est Run File',
      },
      {
        '<leader>Tn',
        function()
          require('neotest').run.run()
        end,
        desc = '[T]est Run [N]earest',
      },
      {
        '<leader>Td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '[T]est [D]ebug Nearest',
      },
      {
        '<leader>Ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '[T]est [S]ummary',
      },
      {
        '<leader>To',
        function()
          require('neotest').output.open { enter = true }
        end,
        desc = '[T]est [O]utput',
      },
      {
        '<leader>TS',
        function()
          require('neotest').run.stop()
        end,
        desc = '[T]est [S]top',
      },
    },
  },

  -- Refactoring tools
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup {
        prompt_func_return_type = {
          go = true,
          cpp = true,
          c = true,
        },
        prompt_func_param_type = {
          go = true,
          cpp = true,
          c = true,
        },
      }
    end,
    keys = {
      {
        '<leader>re',
        function()
          require('refactoring').refactor 'Extract Function'
        end,
        mode = 'x',
        desc = '[R]efactor [E]xtract Function',
      },
      {
        '<leader>rf',
        function()
          require('refactoring').refactor 'Extract Function To File'
        end,
        mode = 'x',
        desc = '[R]efactor Extract to [F]ile',
      },
      {
        '<leader>rv',
        function()
          require('refactoring').refactor 'Extract Variable'
        end,
        mode = 'x',
        desc = '[R]efactor Extract [V]ariable',
      },
      {
        '<leader>ri',
        function()
          require('refactoring').refactor 'Inline Variable'
        end,
        mode = { 'n', 'x' },
        desc = '[R]efactor [I]nline Variable',
      },
      {
        '<leader>rb',
        function()
          require('refactoring').refactor 'Extract Block'
        end,
        mode = 'n',
        desc = '[R]efactor Extract [B]lock',
      },
    },
  },

  -- Session management
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath 'state' .. '/sessions/'),
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
    },
    keys = {
      {
        '<leader>qs',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
      {
        '<leader>ql',
        function()
          require('persistence').load { last = true }
        end,
        desc = 'Restore Last Session',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        desc = "Don't Save Session",
      },
    },
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    event = 'BufReadPost',
    keys = {
      { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    },
    init = function()
      -- nvim folding using LSP
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      -- nvim lsp as LSP client
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      -- Note: With vim.lsp.config API, servers are configured individually
      -- You can list servers manually if needed: {'lua_ls', 'pyright', 'ruff'}
      -- For now, relying on mason-lspconfig handlers in lsp_config.lua
      require('ufo').setup()
    end,
  },
  {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-a>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
      }
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      -- Basic keymaps
      vim.keymap.set('n', '<leader>aa', function()
        harpoon:list():add()
      end, { desc = 'Add file to Harpoon' })
      vim.keymap.set('n', '<leader>am', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon Menu' })

      -- Navigate to files
      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = '1st file' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = '2nd file' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = '3rd file' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = '4th file' })
      vim.keymap.set('n', '<leader>5', function()
        harpoon:list():select(5)
      end, { desc = '5th file' })

      -- Toggle previous & next buffers
      vim.keymap.set('n', '<leader>aj', function()
        harpoon:list():next()
      end, { desc = 'Next Harpoon file' })
      vim.keymap.set('n', '<leader>ak', function()
        harpoon:list():prev()
      end, { desc = 'Previous Harpoon file' })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown' },
    opts = {
      enabled = true,
      render_modes = { 'n', 'c', 't' }, -- Normal, Command, Terminal modes
      debounce = 100, -- Milliseconds before updating
      file_types = { 'markdown' },
      max_file_size = 10.0, -- Maximum file size in MB
    },
  },
  { 'mbbill/undotree' },
  {
    'benomahony/uv.nvim',
    config = function()
      require('uv').setup()
    end,
  },


  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    keys = {
      { '<leader>e', ':NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
      { '\\', ':NvimTreeFindFile<CR>', desc = 'NvimTree Find File' },
    },
    config = function()
      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          width = 35,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false, -- Show dotfiles by default (toggle with 'H' in tree)
        },
      }
    end,
  },

  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm' },
    keys = {
      { [[<c-\>]], desc = 'Toggle terminal' },
      { '<leader>gg', ':ToggleTerm direction=float<CR>lazygit<CR>', desc = 'Lazygit' },
    },
    opts = {
      open_mapping = [[<c-\>]],
      direction = 'float',
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      close_on_exit = true, -- close the terminal window when the process exits
    },
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    -- event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.VM_theme = 'purplegray'
      vim.g.VM_mouse_mappings = 1
    end,
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument/[D]iagnostic/[D]ebug' },
        { '<leader>r', group = '[R]ename/[R]efactor' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle/[T]erminal' },
        { '<leader>T', group = '[T]est' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>a', group = 'H[a]rpoon' },
        { '<leader>g', group = '[G]it' },
        { '<leader>q', group = '[Q]uit/Session' },
        { '<leader>x', group = 'Diagnostics (Trouble)' },
        { '<leader>f', group = '[F]ormat' },
        { '<leader>o', group = '[O]cto/GitHub' },
      },
    },
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function() end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

  { -- Format on save enabled, also manually with <leader>fw
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fw',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },
    opts = function()
      local formatters_config = require 'custom.formatters'
      return {
        notify_on_error = true,
        format_on_save = nil, -- Disabled by default - use <leader>fw to format manually, <leader>ft to toggle
        formatters_by_ft = formatters_config.formatters_by_ft,
        formatters = formatters_config.formatters,
      }
    end,
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- -- Lua
      -- Lua
      require('onedark').setup {
        -- Main options --
        style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true, -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = '<leader>tS', -- keybind to toggle theme style
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = 'italic',
          keywords = 'bold',
          functions = 'bold',
          strings = 'none',
          variables = 'bold',
        },

        -- Lualine options --
        lualine = {
          transparent = true, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {
          bright_orange = '#ff8800', -- define a new color
          green = '#00ffaa', -- redefine an existing color
          bright_purple = '#cc99cc',
        },
        highlights = {
          ['@keyword'] = { fg = '$bright_orange' },
          ['@string'] = { fg = '$bright_purple', fmt = 'bold' },
          ['@function'] = { fg = 'yellow', fmt = 'italic' },
          ['@function.builtin'] = { fg = 'bright_blue', fmt = 'bold' },
          ['@comment'] = { fg = '$green', fmt = 'italic' },
        },

        -- Plugins Config --
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nner [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- mini.statusline removed - using lualine.nvim instead for statusline

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'python' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = {},
        disable = function(lang, bufnr) -- Disable in files with more than 5K
          return vim.api.nvim_buf_line_count(bufnr) > 5000 or lang == 'json'
        end,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst', -- Only load for Typst files
    version = '1.*',
    opts = {},
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'VeryLazy',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    config = function()
      local neoscroll = require 'neoscroll'
      neoscroll.setup {
        mappings = {}, -- Disable default mappings, we'll use custom ones
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing = 'quadratic',
        performance_mode = false,
      }

      -- Custom smooth scrolling keymaps
      local keymap = {
        ['<C-u>'] = function()
          neoscroll.ctrl_u { duration = 250, easing = 'sine' }
        end,
        ['<C-d>'] = function()
          neoscroll.ctrl_d { duration = 250, easing = 'sine' }
        end,
        ['<C-b>'] = function()
          neoscroll.ctrl_b { duration = 450, easing = 'circular' }
        end,
        ['<C-f>'] = function()
          neoscroll.ctrl_f { duration = 450, easing = 'circular' }
        end,
        ['<C-y>'] = function()
          neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
        end,
        ['<C-e>'] = function()
          neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
        end,
        ['zt'] = function()
          neoscroll.zt { half_win_duration = 250 }
        end,
        ['zz'] = function()
          neoscroll.zz { half_win_duration = 250 }
        end,
        ['zb'] = function()
          neoscroll.zb { half_win_duration = 250 }
        end,
      }

      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end,
  },
  {
    'cpea2506/one_monokai.nvim',
    priority = 1000,
    config = function()
      require('one_monokai').setup {
        transparent = true,
        colors = {},
        highlights = function(colors)
          return {}
        end,
        italics = true,
      }
      -- Uncomment to set as default colorscheme
      -- vim.cmd.colorscheme 'one_monokai'
    end,
  },
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      }
    end,
  },
  {
    'echasnovski/mini.icons',
    version = false,
    config = function()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  {
    'y3owk1n/undo-glow.nvim',
    event = 'VeryLazy',
    opts = {
      animation = {
        enabled = true,
        duration = 300,
        animation_type = 'zoom',
        window_scoped = true,
      },
      highlights = {
        undo = {
          hl_color = { bg = '#693232' }, -- Dark muted red
        },
        redo = {
          hl_color = { bg = '#2F4640' }, -- Dark muted green
        },
        yank = {
          hl_color = { bg = '#7A683A' }, -- Dark muted yellow
        },
        paste = {
          hl_color = { bg = '#325B5B' }, -- Dark muted cyan
        },
        search = {
          hl_color = { bg = '#5C475C' }, -- Dark muted purple
        },
        comment = {
          hl_color = { bg = '#7A5A3D' }, -- Dark muted orange
        },
        cursor = {
          hl_color = { bg = '#793D54' }, -- Dark muted pink
        },
      },
      priority = 2048 * 3,
    },
    keys = {
      {
        'u',
        function()
          require('undo-glow').undo()
        end,
        mode = 'n',
        desc = 'Undo with highlight',
        noremap = true,
      },
      {
        'U',
        function()
          require('undo-glow').redo()
        end,
        mode = 'n',
        desc = 'Redo with highlight',
        noremap = true,
      },
      {
        'p',
        function()
          require('undo-glow').paste_below()
        end,
        mode = 'n',
        desc = 'Paste below with highlight',
        noremap = true,
      },
      {
        'P',
        function()
          require('undo-glow').paste_above()
        end,
        mode = 'n',
        desc = 'Paste above with highlight',
        noremap = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        callback = function()
          require('undo-glow').yank()
        end,
      })
    end,
  },
  require 'custom.indent_line',
  require 'custom.lint',
  require 'custom.lsp_config',
  require 'custom.autopairs',
  require 'custom.gitsigns',
}
