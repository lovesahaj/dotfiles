local Util = require("lazyvim.util")

return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = { "ToggleTerm" },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      close_on_exit = true, -- close the terminal window when the process exits
    },
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = "curved",
      -- like `size`, width and height can be a number or function which is passed the current terminal
      row = 3,
      col = 3,
      width = 12,
      height = 3,
      winblend = 3,
    },
  },
}
