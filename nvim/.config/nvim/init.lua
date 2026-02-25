-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','  -- Use comma for localleader to avoid conflicts with Octo.nvim mappings

require 'custom.keymaps'
require 'custom.vim_config'

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local function require_all_in_directory(dir)
  -- Get the full path for the directory relative to your Neovim config directory
  local config_path = vim.fn.stdpath 'config' .. '/' .. dir

  -- Iterate over all files in the directory
  for _, file in ipairs(vim.fn.readdir(config_path)) do
    -- Only require files ending in '.lua'
    if file:sub(-4) == '.lua' then
      -- Remove .lua extension
      local module_name = file:sub(1, -5)

      -- Build the require path relative to the directory, without 'lua/'
      local require_path = dir:gsub('^lua/', '') .. '/' .. module_name

      -- Normalize slashes for require (Lua uses dots instead of slashes)
      require_path = require_path:gsub('/', '.')

      -- Require the module
      require(require_path)
    end
  end
end

-- Robust Python path detection for DAP with virtual environment support
local function get_python_path()
  -- Check for VIRTUAL_ENV environment variable
  local venv = os.getenv('VIRTUAL_ENV')
  if venv then
    return venv .. '/bin/python'
  end

  -- Check for uv-managed virtual environment
  local cwd = vim.fn.getcwd()
  -- uv typically creates .venv in the project root
  local uv_venv = cwd .. '/.venv/bin/python'
  if vim.fn.executable(uv_venv) == 1 then
    -- Verify it's a uv project by checking for uv.lock or pyproject.toml
    if vim.fn.filereadable(cwd .. '/uv.lock') == 1 or vim.fn.filereadable(cwd .. '/pyproject.toml') == 1 then
      return uv_venv
    end
  end

  -- Check for common virtual environment directories in project root
  local venv_paths = {
    cwd .. '/.venv/bin/python',
    cwd .. '/venv/bin/python',
    cwd .. '/.virtualenv/bin/python',
    cwd .. '/env/bin/python',
  }
  
  for _, path in ipairs(venv_paths) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  -- Check for Poetry virtual environment
  local poetry_venv = vim.fn.system('poetry env info -p 2>/dev/null'):gsub('\n', '')
  if poetry_venv ~= '' and vim.fn.isdirectory(poetry_venv) == 1 then
    return poetry_venv .. '/bin/python'
  end

  -- Check for Pipenv virtual environment
  local pipenv_venv = vim.fn.system('pipenv --venv 2>/dev/null'):gsub('\n', '')
  if pipenv_venv ~= '' and vim.fn.isdirectory(pipenv_venv) == 1 then
    return pipenv_venv .. '/bin/python'
  end

  -- Fall back to system python
  local system_python = vim.fn.system('which python3 2>/dev/null'):gsub('\n', '')
  if system_python ~= '' then
    return system_python
  end

  -- Last resort
  return vim.fn.system('which python'):gsub('\n', '') or '/usr/bin/python'
end
require_all_in_directory 'lua/custom/plugins/config'
-- Setup dap-python with dynamic path detection
local dap_python = require('dap-python')
dap_python.setup(get_python_path())

-- Add a command to refresh Python path if you switch projects
vim.api.nvim_create_user_command('DapPythonRefresh', function()
  local new_path = get_python_path()
  dap_python.setup(new_path)
  print('DAP Python path updated to: ' .. new_path)
end, { desc = 'Refresh DAP Python interpreter path' })
