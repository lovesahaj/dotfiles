return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    
    -- Define a floating terminal for lazygit
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
      float_opts = {
        border = "curved",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        -- ESC twice to exit
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc><esc>", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
    })

    -- Define global functions for which-key to use
    _G.lazygit_toggle = function()
      lazygit:toggle()
    end
    
    _G.run_python_file = function()
      local file = vim.fn.expand('%:p')
      local python_path = vim.fn.system('which python'):gsub('\n', '')
      local term = Terminal:new({
        cmd = python_path .. ' ' .. file,
        direction = 'float',
        close_on_exit = false,
      })
      term:toggle()
    end
    
    _G.run_js_ts_file = function()
      local file = vim.fn.expand('%:p')
      local file_ext = vim.fn.expand('%:e')
      local cmd = ''
      
      if file_ext == 'ts' then
        cmd = 'tsx ' .. file
      else
        cmd = 'node ' .. file
      end
      
      local term = Terminal:new({
        cmd = cmd,
        direction = 'float',
        close_on_exit = false,
      })
      term:toggle()
    end
    
    _G.toggle_term_layout = function()
      local terms = require('toggleterm.terminal')
      local term = terms.get(1)
      if term and term.direction == 'float' then
        term:close()
        local new_term = Terminal:new({
          direction = 'horizontal',
          close_on_exit = true,
        })
        new_term:toggle()
      elseif term and term.direction == 'horizontal' then
        term:close()
        local new_term = Terminal:new({
          direction = 'float',
          close_on_exit = true,
        })
        new_term:toggle()
      else
        require('toggleterm').toggle(1)
      end
    end
    
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
      direction = 'float',
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
      },
    })

    function _G.set_terminal_keymaps()
      local opts = {noremap = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    -- Function to create a terminal with a custom command (for which-key's <leader>tc)
    _G.create_term_with_cmd = function(cmd)
      local term = Terminal:new({
        cmd = cmd,
        direction = 'float',
        close_on_exit = false,
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })
      term:toggle()
    end
    
    -- Note: Keymaps are registered in which-key config file
  end
}
