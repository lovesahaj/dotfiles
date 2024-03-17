-- bootstrap lazy.nvim, LazyVim and your plugins
-- Set the tabstop, expandtab, softtabstop, and shiftwidth options
vim.api.nvim_set_option("tabstop", 4)
vim.api.nvim_set_option("expandtab", true)
vim.api.nvim_set_option("softtabstop", 4)
vim.api.nvim_set_option("shiftwidth", 4)
require("config.lazy")
