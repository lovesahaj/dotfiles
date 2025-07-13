# 🚀 Personal Neovim Configuration

A modern, feature-rich Neovim configuration built for development productivity. This configuration is based on kickstart.nvim but heavily customized with additional plugins, formatting, debugging, and productivity features.

## ✨ Features

### 🎨 **User Interface**
- **Colorschemes**: Oxocarbon (default), Tokyonight, Catppuccin
- **Status Line**: Lualine with git integration and file info
- **File Explorer**: Nvim-tree with custom keymaps
- **Notifications**: Noice.nvim for better UI messages
- **Code Folding**: UFO with Treesitter integration
- **Indentation Guides**: Visual indent lines

### 🔍 **Navigation & Search**
- **Fuzzy Finder**: Telescope with file, grep, and symbol search
- **Quick Jump**: Flash.nvim for fast cursor movement
- **File Marks**: Harpoon for quick file switching
- **Word Hopping**: Hop.nvim for precise navigation

### 💻 **Code Intelligence**
- **LSP**: Full Language Server Protocol support
- **Autocompletion**: nvim-cmp with multiple sources
- **Formatting**: Conform.nvim with 20+ language formatters
- **Linting**: nvim-lint for code quality
- **Debugging**: DAP integration with Python support
- **Treesitter**: Advanced syntax highlighting and text objects

### 🛠️ **Development Tools**
- **Git Integration**: Gitsigns, Lazygit integration
- **Terminal**: ToggleTerm with floating and split modes
- **Search & Replace**: Spectre for project-wide operations
- **Auto-pairs**: Smart bracket and quote completion
- **Undo Tree**: Visual undo history

## 📦 Installation

### Prerequisites

1. **Neovim 0.9+** (latest stable recommended)
2. **Git** for plugin management
3. **Node.js** for LSP servers
4. **Python 3** for Python development features
5. **A Nerd Font** for icons (recommended: JetBrains Mono Nerd Font)

### Quick Setup

```bash
# Backup existing configuration (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone <your-repo-url> ~/.config/nvim

# Start Neovim - plugins will install automatically
nvim
```

### Post-Installation

1. **Install formatters and linters**:
   ```bash
   # Open Neovim and run:
   :Mason
   ```
   Install your preferred tools for languages you work with.

2. **Configure Python path** (for debugging):
   The configuration automatically detects your Python installation.

## 🎯 Key Mappings

### Leader Key: `<Space>`

### 📁 **File Operations**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle NvimTree | File explorer |
| `\\` | Find current file | Locate file in tree |
| `<leader>sf` | Find files | Telescope file search |
| `<leader>sg` | Live grep | Search in files |
| `<leader>sw` | Search word | Search current word |

### 🔧 **Formatting & Code Actions**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>fw` | Format buffer | Manual formatting |
| `<leader>fi` | Format info | Show formatter details |
| `<leader>ft` | Toggle auto-format | Enable/disable format on save |

### 🐛 **Debugging**
| Key | Action | Description |
|-----|--------|-------------|
| `<F5>` | Continue | Start/continue debugging |
| `<F10>` | Step over | Debug step over |
| `<F11>` | Step into | Debug step into |
| `<F12>` | Step out | Debug step out |
| `<leader>b` | Toggle breakpoint | Set/remove breakpoint |
| `<leader>du` | Toggle DAP UI | Show/hide debug interface |

### 🌳 **Git Operations**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gs` | Stage hunk | Stage git changes |
| `<leader>gr` | Reset hunk | Reset git changes |
| `<leader>gp` | Preview hunk | Preview changes |
| `<leader>gb` | Blame line | Show git blame |
| `<leader>tg` | Lazygit | Open Lazygit interface |

### 🖥️ **Terminal**
| Key | Action | Description |
|-----|--------|-------------|
| `<C-\>` | Toggle terminal | Default terminal |
| `<leader>tf` | Float terminal | Floating terminal |
| `<leader>th` | Horizontal terminal | Split terminal |
| `<leader>tv` | Vertical terminal | Vertical split terminal |

### 🚀 **Navigation**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>H` | Hop word | Quick word jump |
| `]d` / `[d` | Next/prev diagnostic | Navigate diagnostics |
| `]c` / `[c` | Next/prev git change | Navigate git hunks |

### 🔍 **Search & Replace**
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sp` | Toggle Spectre | Search & replace panel |
| `<leader>sw` | Search word (Spectre) | Search current word |
| `<leader>sr` | Search in file | File-specific search |

## 📂 Configuration Structure

```
nvim/
├── init.lua                          # Main entry point
├── lua/custom/
│   ├── keymaps.lua                  # Key mappings
│   ├── vim_config.lua               # Vim options and settings
│   ├── formatters.lua               # Formatter configurations
│   ├── lsp_config.lua               # LSP server configurations
│   ├── lint.lua                     # Linting setup
│   ├── autopairs.lua                # Auto-pairing setup
│   ├── gitsigns.lua                 # Git integration
│   ├── indent_line.lua              # Indentation guides
│   └── plugins/
│       ├── init.lua                 # Main plugin definitions
│       ├── colorscheme.lua          # Color scheme configs
│       ├── lualine.lua              # Status line config
│       ├── noice.lua                # UI improvements
│       ├── nvim-ufo.lua            # Code folding
│       ├── spectre.lua              # Search & replace
│       ├── toggleterm.lua           # Terminal integration
│       ├── treesitter-textobjects.lua # Text objects
│       ├── which-key.lua            # Keybinding help
│       └── config/
│           ├── dap.lua              # Debug configurations
│           ├── lsp.lua              # LSP specific configs
│           ├── nvim-cmp.lua         # Completion setup
│           ├── nvim-tree.lua        # File explorer config
│           └── telescope.lua        # Fuzzy finder config
└── README_formatters.md             # Formatter documentation
```

## 🎨 Customization

### Changing Colorscheme

Edit `lua/custom/plugins/colorscheme.lua`:

```lua
-- Change the priority to make a different theme default
{
  "your-preferred-theme",
  priority = 1001,  -- Higher priority loads first
  config = function()
    vim.cmd.colorscheme "your-theme-name"
  end,
}
```

### Adding New Formatters

Edit `lua/custom/formatters.lua`:

```lua
-- Add to formatters_by_ft table
M.formatters_by_ft = {
  -- existing formatters...
  newlang = { 'formatter-name' },
}

-- Add custom formatter config (optional)
M.formatters = {
  -- existing configs...
  ['formatter-name'] = {
    prepend_args = { '--option', 'value' },
  },
}
```

### Configuring LSP Servers

Edit `lua/custom/lsp_config.lua` or add files in `lua/custom/plugins/config/`:

```lua
local servers = {
  -- Add your language servers here
  your_lsp = {
    settings = {
      -- LSP-specific settings
    },
  },
}
```

## 🔧 Language Support

### Built-in Support
- **Lua**: stylua formatting, lua_ls LSP
- **Python**: ruff + isort formatting, pyright LSP, DAP debugging
- **JavaScript/TypeScript**: prettier formatting, ts_ls LSP
- **Go**: gofmt + goimports formatting, gopls LSP
- **Rust**: rustfmt formatting, rust-analyzer LSP
- **And many more...**

### Adding New Languages

1. **Add LSP server** in `lua/custom/lsp_config.lua`
2. **Add formatter** in `lua/custom/formatters.lua`
3. **Install tools** via `:Mason`

## 🚀 Performance Features

- **Lazy loading**: Plugins load only when needed
- **Fast startup**: Optimized plugin loading
- **Efficient formatting**: Manual formatting by default
- **Smart completion**: Context-aware suggestions
- **Minimal configuration**: Clean, organized structure

## 🛠️ Troubleshooting

### Common Issues

1. **Plugins not loading**: Run `:Lazy sync` to update plugins
2. **Formatters not working**: Check `:Mason` for installed tools
3. **LSP not starting**: Verify language server installation
4. **Python debugging issues**: Check Python path detection

### Useful Commands

```vim
:checkhealth          " Check Neovim health
:Lazy                 " Plugin manager
:Mason                " LSP/tool installer
:ConformInfo          " Formatter information
:LspInfo              " LSP server status
```

## 📈 What's Next?

- **Customize keymaps** in `lua/custom/keymaps.lua`
- **Add your preferred colorscheme**
- **Configure language-specific settings**
- **Add your own plugins** in `lua/custom/plugins/`
- **Set up project-specific configurations**

## 🤝 Contributing

Feel free to:
- Fork this configuration
- Submit issues for bugs
- Suggest improvements
- Share your customizations

## 📝 License

This configuration is open source and available under the [MIT License](LICENSE.md).

---

**Happy coding! 🎉**

> This configuration prioritizes developer productivity with manual formatting, comprehensive language support, and a clean, organized structure.
