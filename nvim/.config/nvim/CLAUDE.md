# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a modular Neovim configuration built on lazy.nvim, designed for development productivity across 20+ programming languages. It emphasizes **manual control over automatic behavior** - format when you want, debug when you need.

## Essential Commands

### Plugin & Tool Management

```vim
:Lazy              # Plugin manager UI
:Lazy sync         # Update all plugins to locked versions
:Mason             # Install/manage LSP servers, formatters, linters
:ConformInfo       # Check formatter status for current buffer
:LspInfo           # Check active LSP servers
```

### Health Checks & Diagnostics

```vim
:checkhealth          # Overall Neovim health
:checkhealth lsp      # LSP-specific diagnostics
:checkhealth telescope
:Lazy profile         # Check plugin load times
```

### Development

```bash
# This is a Neovim configuration - no traditional build/test system
# Testing changes: Simply restart Neovim or :source init.lua

# Format Lua code before committing
stylua lua/        # Uses .stylua.toml (2-space indent, Unix line endings)
```

## Architecture

### Entry Point & Plugin Loading

- **init.lua** (92 lines) - Bootstraps lazy.nvim and imports `custom.plugins`
- Uses Neovim 0.10+ APIs (`vim.lsp.config`, `vim.lsp.enable`)
- Plugins defined in `lua/custom/plugins/init.lua` (600+ lines)
- Advanced configs auto-loaded from `lua/custom/plugins/config/` via `require_all_in_directory()`

### Core Configuration Modules

**lua/custom/keymaps.lua**

- Leader key: `<Space>`
- Global keybindings (navigation, file explorer, diagnostics)
- Format toggles: `<leader>fw` (format buffer), `<leader>ft` (toggle auto-format)

**lua/custom/vim_config.lua**

- Neovim options: line numbers, mouse, clipboard, indentation
- 2-space default indent, smart case search, persistent undo

**lua/custom/formatters.lua** - Critical for formatting

- 20+ languages: Lua, Python, JS/TS, Go, Rust, C/C++, Shell, Ruby, Java, Swift, Kotlin, Dart, Elixir, Haskell, OCaml, Zig, Terraform, TOML, Protobuf
- Custom settings: stylua (2-space), prettier (single quotes), ruff (line length 88)
- Manual formatting philosophy: Format on demand, NOT auto-save by default
- Exports `M.formatters_by_ft` table and utility functions

**lua/custom/lsp_config.lua**

- Uses new `vim.lsp.config()` API (Neovim 0.10+)
- Mason auto-installs: pyright, ruff, lua_ls, tinymist
- LSP keybindings set on LspAttach event (gd, gr, K, `<leader>rn`, etc.)

### Plugin Organization

**lua/custom/plugins/init.lua**

- Main plugin definitions with lazy loading
- Event-driven loading (VimEnter, InsertEnter, BufReadPre)
- Dependencies explicitly declared

**lua/custom/plugins/config/**

- **dap.lua** - Python debugging setup, debugpy integration
- **lsp.lua** - Pyright-specific configuration
- **nvim-cmp.lua** - Completion engine with snippets
- **nvim-tree.lua** - File explorer settings
- **telescope.lua** - Fuzzy finder keybindings

### Key Dependencies

**Core Infrastructure:**

- lazy.nvim (plugin manager)
- plenary.nvim (Lua utilities)
- mason.nvim, mason-lspconfig.nvim (LSP/tool installer)

**LSP & Completion:**

- nvim-lspconfig, nvim-cmp, LuaSnip
- conform.nvim (formatting), nvim-lint (linting)

**Navigation:**

- telescope.nvim (fuzzy finder)
- nvim-tree.lua (file explorer)
- hop.nvim (word jumping), flash.nvim (enhanced search)
- harpoon (file bookmarks)

**Git & Terminal:**

- gitsigns.nvim, toggleterm.nvim (lazygit integration)
- nvim-spectre (project-wide search/replace)

**Debugging:**

- nvim-dap + nvim-dap-ui + nvim-dap-python

## Critical Patterns to Follow

### Adding Language Support

**1. LSP Server**
Edit `lua/custom/lsp_config.lua`:

```lua
local servers = {
  your_language_server = {
    settings = {
      -- server-specific settings
    }
  }
}
```

**2. Formatter**
Edit `lua/custom/formatters.lua`:

```lua
M.formatters_by_ft = {
  yourlang = { 'formatter-name' },
}
```

**3. Install Tools**

```vim
:Mason  # Search and install LSP/formatter
```

### Modifying Plugin Configuration

**Simple plugins:** Edit `lua/custom/plugins/init.lua` directly
**Complex plugins:** Create/edit in `lua/custom/plugins/config/`

All files in `config/` are auto-loaded via `require_all_in_directory()` - no need to manually import.

### Formatting Philosophy

**DO NOT enable auto-format on save by default** - this config respects manual control:

- Format buffer: `<leader>fw`
- Toggle auto-format: `<leader>ft`
- Check formatter: `:ConformInfo`

When adding formatters, maintain this philosophy unless user explicitly requests auto-format.

### Keybinding Conventions

- Leader key: `<Space>`
- File operations: `<leader>s*` (search), `<leader>e` (explorer)
- Code actions: `<leader>c*` (ca=code action, rn=rename)
- Format: `<leader>f*` (fw=format, fi=info, ft=toggle)
- Debug: `<F5>`, `<F10>`, `<F11>`, `<F12>`, `<leader>b` (breakpoint)
- Terminal: `<Ctrl-\>`, `<leader>t*`
- Git: `<leader>g*`, `]c`/`[c` (hunks)

Use which-key descriptions when adding keymaps:

```lua
vim.keymap.set('n', '<leader>x', ':YourCommand<CR>', { desc = 'Short description' })
```

## Common Tasks

### Adding a New Plugin

1. Add to `lua/custom/plugins/init.lua`:

```lua
{
  'author/plugin-name',
  event = 'VeryLazy', -- or other lazy-loading trigger
  config = function()
    require('plugin-name').setup({
      -- configuration
    })
  end,
}
```

2. Restart Neovim - lazy.nvim auto-installs
3. Run `:Lazy sync` to update lock file

### Debugging LSP Issues

```vim
:LspInfo           # Check active servers
:LspRestart        # Restart servers
:Mason             # Verify installation
:checkhealth lsp
```

Check logs: `~/.local/state/nvim/lsp.log`

### Debugging Formatter Issues

```vim
:ConformInfo       # Shows available formatters for filetype
```

Check `lua/custom/formatters.lua` - ensure formatter is in `formatters_by_ft` table
Verify tool installed: `:Mason`

### Performance Optimization

```vim
:Lazy profile      # Identify slow plugins
```

Check lazy loading: Ensure plugins use `event`, `cmd`, or `ft` fields
Minimize plugins loaded at startup (VimEnter)

## File Structure Summary

```
nvim/
├── init.lua                        # Entry point (92 lines)
├── lazy-lock.json                  # Plugin versions (57 plugins)
├── .stylua.toml                    # Lua formatter config
└── lua/custom/
    ├── keymaps.lua                 # Global keybindings
    ├── vim_config.lua              # Neovim options
    ├── formatters.lua              # 20+ language formatters
    ├── lsp_config.lua              # LSP server configs
    ├── autopairs.lua               # Auto-brackets
    ├── gitsigns.lua                # Git keymaps
    ├── indent_line.lua             # Indent guides
    ├── lint.lua                    # Linting setup
    └── plugins/
        ├── init.lua                # Plugin definitions (600+ lines)
        ├── colorscheme.lua         # Theme config
        ├── lualine.lua             # Status line
        ├── nvim-ufo.lua            # Code folding
        ├── spectre.lua             # Search/replace
        ├── toggleterm.lua          # Terminal integration
        ├── treesitter-textobjects.lua
        ├── which-key.lua           # Keymap helper
        └── config/                 # Advanced configs (auto-loaded)
            ├── dap.lua             # Debug adapter
            ├── lsp.lua             # Pyright config
            ├── nvim-cmp.lua        # Completion
            ├── nvim-tree.lua       # File explorer
            └── telescope.lua       # Fuzzy finder
```

## Important Notes

- **Neovim 0.10+ required** - Uses new LSP APIs
- **Nerd Font recommended** - For icons in UI
- **Terminal integration** - Lazygit, Python/JS runners via toggleterm
- **Python debugging** - Pre-configured with debugpy, detects virtual environments
- **Multiple themes** - OneDark (default), Tokyonight, Catppuccin, Oxocarbon
- **57 plugins** - All version-locked in lazy-lock.json for stability

## When Making Changes

1. **Read before modifying** - Use Read tool on relevant config files
2. **Maintain modularity** - Keep configs in appropriate files (formatters.lua, lsp_config.lua, etc.)
3. **Test in Neovim** - Restart or `:source` changed files
4. **Check health** - Run `:checkhealth` after significant changes
5. **Preserve philosophy** - Manual control, lazy loading, performance focus
6. **Update lock file** - `:Lazy sync` after plugin changes
