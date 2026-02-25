-- GitHub Issues, PRs, and Discussions in Neovim
-- https://github.com/pwntester/octo.nvim
return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  -- Keybindings are defined in which-key.lua for centralized management
  opts = {
    picker = 'telescope',
    enable_builtin = true, -- shows a list of builtin actions when no action is provided
    default_remote = { 'upstream', 'origin' },
    default_merge_method = 'squash',
    reviews = {
      auto_show_threads = true,
      focus = 'right',
    },
    file_panel = {
      size = 10,
      use_icons = true,
    },
  },
  config = function(_, opts)
    require('octo').setup(opts)

    -- Register treesitter markdown parser for octo buffers
    vim.treesitter.language.register('markdown', 'octo')
  end,
}
