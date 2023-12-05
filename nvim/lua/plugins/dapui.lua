return {
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    -- Add a lazy-loading condition here
    -- For example, load on a specific command or filetype
    cmd = "DapUIOpen", -- This will load the plugin when you run :DapUIOpen
    config = function()
      -- Configuration for nvim-dap-ui
    end,
  },
}
