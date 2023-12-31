return {
  -- Modify Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Add nvim-ts-autotag
      { "windwp/nvim-ts-autotag" },

      -- Modify nvim-ts-context-commentstring
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
          config = {
            c = { __default = "// %s", __multiline = "/* %s */" },
            cpp = { __default = "// %s", __multiline = "/* %s */" },
          },
        },
      },

      -- Add nvim-treesitter-context
      {
        "nvim-treesitter/nvim-treesitter-context",
        -- event = "BufReadPre",
        -- event = "LazyFile",
        opts = {
          mode = "cursor",
          -- Avoid the sticky context from growing a lot.
          max_lines = 4,
          -- Match the context lines to the source code.
          multiline_threshold = 1,
        },
        keys = {
          {
            "[T",
            function()
              require("treesitter-context").go_to_context()
            end,
            silent = true,
            desc = "Go to Context",
          },
        },
      },
    },
    -- event = { "BufReadPre" },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "python",
        "lua",
        "json",
        "c",
        "vim",
        "yaml",
        "go",
      })
      return vim.tbl_deep_extend("force", opts, {
        autotag = {
          enable = true,
        },
        matchup = {
          enable = true,
        },
      })
    end,
  },
}
