return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = {
        marks = true,      -- shows a list of your marks on ' and `
        registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20,
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ...
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
      -- window = {
      --   border = "single",      -- none, single, double, shadow
      --   position = "bottom",    -- bottom, top
      --   margin = { 1, 0, 1, 0 }, -- top, right, bottom, left
      --   padding = { 1, 2, 1, 2 }, -- top, right, bottom, left
      -- },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
      },
      -- ignore_missing = false,   -- enable this to hide mappings for which you didn't specify a label
      -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
      show_help = true,         -- show a help message in the command line for using WhichKey
      show_keys = true,         -- show the key combination pressed
      -- triggers = "auto",        -- automatically set up triggers
      -- triggers_nowait = {       -- triggers that shouldn't wait for timeoutlen
      --   -- marks
      --   "`",
      --   "'",
      --   "g`",
      --   "g'",
      --   -- registers
      --   '"',
      --   "<c-r>",
      --   -- spelling
      --   "z=",
      -- },
      -- triggers_blacklist = {
      --   -- list of mode / prefixes that should never be hooked by WhichKey
      --   i = { "j", "k" },
      --   v = { "j", "k" },
      -- },
    })

    -- Note: The global terminal functions are defined in the toggleterm.lua file
    
    local wk = require("which-key")
    wk.add({
      -- Group definitions
      { "<leader>f", group = "+file/find" },
      { "<leader>g", group = "+git" },
      { "<leader>d", group = "+debug/diagnostics" },
      { "<leader>t", group = "+toggle/terminal" },
      { "<leader>s", group = "+search" },
      
      -- Terminal related keymaps
      { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Float Terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical Terminal" },
      { "<leader>tg", "<cmd>lua lazygit_toggle()<CR>", desc = "Lazygit" },
      { "<leader>tp", "<cmd>lua run_python_file()<CR>", desc = "Run Python File" },
      { "<leader>tj", "<cmd>lua run_js_ts_file()<CR>", desc = "Run JS/TS File" },
      { "<leader>tt", "<cmd>lua toggle_term_layout()<CR>", desc = "Toggle Terminal Layout" },
      { "<leader>tc", "<cmd>lua vim.ui.input({ prompt = 'Command: ' }, function(input) if input then create_term_with_cmd(input) end end)<CR>", 
        desc = "Run Custom Command" },
    })
  end,
}
