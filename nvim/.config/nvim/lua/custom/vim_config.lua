-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Border characters for floating windows
vim.g.border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default and have relative numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false -- Changed to false as it will be shown in statusline
vim.opt.wrap = true
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.showbreak = '↪ ' -- Show character at the start of wrapped lines

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Better completion experience
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Better wildmenu
vim.opt.wildmode = {'longest:full', 'full'}
vim.opt.wildignore:append {'*/node_modules/*', '*/vendor/*', '*.o', '*.pyc', '*/__pycache__/*'}

-- Default indent settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2 
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Show line/column info
vim.opt.ruler = true

-- Keep cursor in the middle of the screen while scrolling (set once)
vim.opt.scrolloff = 8 

-- Search settings
vim.opt.hlsearch = true     -- Highlight search matches
vim.opt.incsearch = true    -- Show matches as you type
