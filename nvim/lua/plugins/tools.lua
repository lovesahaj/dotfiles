return {
  -- Better scope for buffers throughout tabs
  {
    "tiagovla/scope.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    event = "LazyFile",
    opts = {
      restore_state = false,
    },
  },

  -- Better surround for vim-visual-multi
  {
    "tpope/vim-surround",
    event = "LazyFile",
  },

  -- Better qflist??
  {
    "kevinhwang91/nvim-bqf",
    dependencies = {
      "junegunn/fzf",
      "junegunn/fzf.vim",
    },
    ft = { "qf" },
    opts = {},
  },
}
