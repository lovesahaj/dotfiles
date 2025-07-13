-- Formatter configurations for different languages
-- This file contains all formatter settings and configurations

local M = {}

-- Formatters by file type
M.formatters_by_ft = {
  -- Lua
  lua = { 'stylua' },
  
  -- Python
  python = { 'isort', 'ruff' },
  
  -- JavaScript/TypeScript
  javascript = { 'prettierd', 'prettier', stop_after_first = true },
  typescript = { 'prettierd', 'prettier', stop_after_first = true },
  javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  
  -- Web languages
  html = { 'prettierd', 'prettier', stop_after_first = true },
  css = { 'prettierd', 'prettier', stop_after_first = true },
  scss = { 'prettierd', 'prettier', stop_after_first = true },
  json = { 'prettierd', 'prettier', stop_after_first = true },
  jsonc = { 'prettierd', 'prettier', stop_after_first = true },
  yaml = { 'prettierd', 'prettier', stop_after_first = true },
  markdown = { 'prettierd', 'prettier', stop_after_first = true },
  
  -- Go
  go = { 'gofmt', 'goimports' },
  
  -- Rust
  rust = { 'rustfmt' },
  
  -- C/C++
  c = { 'clang-format' },
  cpp = { 'clang-format' },
  
  -- Shell
  sh = { 'shfmt' },
  bash = { 'shfmt' },
  zsh = { 'shfmt' },
  fish = { 'fish_indent' },
  
  -- Nix
  nix = { 'nixpkgs-fmt' },
  
  -- Docker
  dockerfile = { 'dockerfilelint' },
  
  -- SQL
  sql = { 'sqlfluff' },
  
  -- PHP
  php = { 'php-cs-fixer' },
  
  -- Ruby
  ruby = { 'rubocop' },
  
  -- Java
  java = { 'google-java-format' },
  
  -- Swift
  swift = { 'swift-format' },
  
  -- Kotlin
  kotlin = { 'ktlint' },
  
  -- Dart
  dart = { 'dart_format' },
  
  -- Elixir
  elixir = { 'mix' },
  
  -- Haskell
  haskell = { 'ormolu' },
  
  -- OCaml
  ocaml = { 'ocamlformat' },
  
  -- Zig
  zig = { 'zig fmt' },
  
  -- Terraform
  terraform = { 'terraform_fmt' },
  hcl = { 'terraform_fmt' },
  
  -- TOML
  toml = { 'taplo' },
  
  -- Protobuf
  proto = { 'buf' },
}

-- Custom formatter configurations
M.formatters = {
  -- Stylua configuration for Lua
  stylua = {
    prepend_args = { 
      '--indent-type', 'Spaces',
      '--indent-width', '2',
      '--column-width', '120',
    },
  },
  
  -- Prettier configuration
  prettier = {
    prepend_args = { 
      '--tab-width', '2',
      '--single-quote', 'true',
      '--trailing-comma', 'es5',
      '--print-width', '100',
    },
  },
  
  prettierd = {
    prepend_args = { 
      '--tab-width', '2',
      '--single-quote', 'true',
      '--trailing-comma', 'es5',
      '--print-width', '100',
    },
  },
  
  -- Ruff configuration for Python
  ruff = {
  },
  
  -- isort configuration for Python imports
  isort = {
    prepend_args = { 
      '--profile', 'black',
      '--line-length', '88',
    },
  },
  
  -- clang-format configuration for C/C++
  ['clang-format'] = {
    prepend_args = { 
      '--style',
      '{BasedOnStyle: Google, IndentWidth: 2, ColumnLimit: 100}',
    },
  },
  
  -- shfmt configuration for shell scripts
  shfmt = {
    prepend_args = { 
      '-i', '2',  -- indent with 2 spaces
      '-ci',      -- indent case labels
      '-sr',      -- redirect operators will be followed by a space
    },
  },
  
  -- gofmt is simple, no custom args needed
  gofmt = {},
  
  -- rustfmt configuration
  rustfmt = {
    prepend_args = { 
      '--edition', '2021',
    },
  },
  
  -- Add more custom formatter configurations as needed
}

-- File types where LSP formatting should be disabled
-- (useful when you have both LSP and external formatters)
M.disable_lsp_format = {
  'javascript',
  'typescript',
  'javascriptreact', 
  'typescriptreact',
  'html',
  'css',
  'json',
  'python',
  'lua',
  'go',
  'rust',
}

-- Utility function to check if a filetype has a formatter configured
function M.has_formatter(filetype)
  return M.formatters_by_ft[filetype] ~= nil
end

-- Utility function to get available formatters for a filetype
function M.get_formatters(filetype)
  return M.formatters_by_ft[filetype] or {}
end

-- Utility function to add a new formatter for a filetype
function M.add_formatter(filetype, formatter)
  if not M.formatters_by_ft[filetype] then
    M.formatters_by_ft[filetype] = {}
  end
  table.insert(M.formatters_by_ft[filetype], formatter)
end

return M
