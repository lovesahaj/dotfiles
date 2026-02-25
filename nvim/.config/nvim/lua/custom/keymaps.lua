-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- quit all
vim.keymap.set('n', '<leader>qq', ':qa<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'gA', 'ggVG"+y', { desc = 'Copy all to clipboard' })
vim.keymap.set('n', 'gY', 'ggVGy', { desc = 'Yank all to register' })

-- Toggle diagnostics using native Neovim 0.10+ API
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = '[T]oggle [D]iagnostics' })

vim.keymap.set('n', '<leader>p', ':RenderMarkdown toggle<CR>', { desc = 'Toggle markdown rendering' })

vim.keymap.set('n', '<leader>tL', ':Gitsigns toggle_linehl<CR>', { desc = '[T]oggle git [L]ine highlights' })
vim.keymap.set('n', '<leader>i', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle Undotree' })

-- Formatting keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>fw', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer/selection [W]ith conform' })

vim.keymap.set('n', '<leader>fi', ':ConformInfo<CR>', { desc = '[F]ormat [I]nfo - show formatter details' })

-- Toggle format on save (in case you want to temporarily enable it)
vim.keymap.set('n', '<leader>ft', function()
  local conform = require('conform')
  if vim.g.format_on_save_enabled then
    vim.g.format_on_save_enabled = false
    conform.setup({ format_on_save = nil })
    print('Format on save: DISABLED')
  else
    vim.g.format_on_save_enabled = true
    conform.setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    })
    print('Format on save: ENABLED')
  end
end, { desc = '[F]ormat [T]oggle auto-format on save' })
