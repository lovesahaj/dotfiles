# 🚀 Personal Neovim Configuration

A modern, feature-rich Neovim configuration built for development productivity. This setup provides a complete IDE-like experience with intelligent code completion, debugging, formatting, and powerful navigation tools.

> 🎯 **Philosophy**: Manual control over automatic behavior - format when you want, debug when you need, customize as you grow.

## ✨ Key Features

- 🎨 **Multiple colorschemes** - OneDark, Tokyonight, Catppuccin, Oxocarbon
- 🔍 **Advanced search & replace** - Telescope fuzzy finding + Spectre project-wide search/replace
- 💻 **Full LSP support** - Intelligent completion, diagnostics, and code actions
- 🛠️ **Manual formatting** - 20+ language formatters triggered with `<leader>fw`
- 🐛 **Integrated debugging** - Full DAP setup with UI for Python and more
- 🌳 **Git integration** - Gitsigns + Lazygit for complete git workflow
- 🖥️ **Terminal integration** - ToggleTerm with float, horizontal, vertical modes
- 🚀 **Fast navigation** - Hop word jumping, Flash search, Harpoon file marking
- 🎯 **AI assistance** - Supermaven AI code completion
- 📦 **Plugin management** - Lazy.nvim for fast startup and easy management

## 🎯 Essential Shortcuts

### Navigation & Files
| Action | Key | Description |
|--------|-----|-------------|
| **File Explorer** | `<leader>e` | Toggle NvimTree |
| **Find File** | `\\` | Find current file in tree |
| **Fuzzy Find** | `<leader>sf` | Telescope file search |
| **Recent Files** | `<leader>?` | Search recent files |
| **Buffers** | `<leader><leader>` | Find open buffers |
| **Quick Jump** | `<leader>H` | Hop to any word |
| **Flash Search** | `s` | Flash jump to characters |

### Search & Replace
| Action | Key | Description |
|--------|-----|-------------|
| **Live Grep** | `<leader>sg` | Search in project |
| **Search Word** | `<leader>sw` | Search current word |
| **Project Replace** | `<leader>sp` | Spectre search/replace |
| **File Replace** | `<leader>sr` | Replace in current file |
| **In Buffer** | `<leader>/` | Fuzzy search current buffer |

### Code & LSP
| Action | Key | Description |
|--------|-----|-------------|
| **Format Code** | `<leader>fw` | Format buffer/selection |
| **Format Info** | `<leader>fi` | Show formatter details |
| **Go to Definition** | `gd` | Jump to definition |
| **Find References** | `gr` | Find all references |
| **Code Actions** | `<leader>ca` | Show code actions |
| **Rename Symbol** | `<leader>rn` | Rename variable/function |
| **Hover Docs** | `K` | Show documentation |
| **Diagnostics** | `<leader>xx` | Trouble diagnostics |

### Git & Version Control
| Action | Key | Description |
|--------|-----|-------------|
| **Lazygit** | `<leader>tg` | Open Lazygit interface |
| **Git Toggle** | `<leader>gs` | Toggle git line highlights |
| **Next Hunk** | `]c` | Jump to next git change |
| **Prev Hunk** | `[c` | Jump to previous git change |

### Debug (DAP)
| Action | Key | Description |
|--------|-----|-------------|
| **Start/Continue** | `<F5>` | Start or continue debugging |
| **Step Over** | `<F10>` | Step over line |
| **Step Into** | `<F11>` | Step into function |
| **Step Out** | `<F12>` | Step out of function |
| **Toggle Breakpoint** | `<leader>b` | Set/remove breakpoint |
| **Debug UI** | `<leader>du` | Toggle debug interface |

### Terminal & Tools
| Action | Key | Description |
|--------|-----|-------------|
| **Toggle Terminal** | `<Ctrl-\>` | Float terminal |
| **Horizontal Term** | `<leader>th` | Horizontal terminal |
| **Vertical Term** | `<leader>tv` | Vertical terminal |
| **Run Python** | `<leader>tp` | Execute Python file |
| **Run JS/TS** | `<leader>tj` | Execute JS/TS file |
| **Exit Terminal** | `<Esc><Esc>` | Exit terminal mode |

### Harpoon (Quick File Access)
| Action | Key | Description |
|--------|-----|-------------|
| **Mark File** | `<leader>aa` | Add file to harpoon |
| **Harpoon Menu** | `<leader>am` | Show marked files |
| **Jump to 1-5** | `<leader>1-5` | Jump to marked file |
| **Next/Prev** | `<leader>aj/ak` | Navigate marked files |

## 📦 Installation

### Prerequisites
```bash
# Required tools
brew install neovim git make gcc ripgrep fd
# Or on Linux: sudo apt install neovim git make gcc ripgrep fd-find

# Optional but recommended
brew install lazygit python3 node npm
# Nerd Font for icons (e.g., FiraCode Nerd Font)
```

### Setup
```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone configuration
git clone https://github.com/your-username/dotfiles ~/.config/dotfiles
ln -s ~/.config/dotfiles/nvim/.config/nvim ~/.config/nvim

# Start Neovim - plugins will auto-install
nvim

# Install language tools
:Mason
```

### Post-Installation
1. **Install language servers**: `:Mason` → Install LSPs for your languages
2. **Configure formatters**: Check `:ConformInfo` for formatter status
3. **Set up debugging**: Python DAP is pre-configured, add others as needed
4. **Choose colorscheme**: Edit `lua/custom/plugins/colorscheme.lua`

## 🏗️ Project Structure

```
nvim/
├── init.lua                           # Entry point & plugin loader
├── lazy-lock.json                     # Plugin version lock file
├── lua/custom/                        # Main configuration directory
│   ├── keymaps.lua                    # All keybindings & shortcuts
│   ├── vim_config.lua                 # Vim options & settings
│   ├── formatters.lua                 # Formatter configurations
│   ├── autopairs.lua                  # Auto-bracket insertion
│   ├── gitsigns.lua                   # Git integration setup
│   ├── indent_line.lua                # Indentation guides
│   ├── lint.lua                       # Linting configuration
│   ├── lsp_config.lua                 # Language Server Protocol
│   └── plugins/                       # Plugin configurations
│       ├── init.lua                   # Main plugin definitions
│       ├── colorscheme.lua            # Theme configuration
│       ├── lualine.lua                # Status line
│       ├── noice.lua                  # Enhanced UI messages
│       ├── nvim-ufo.lua               # Code folding
│       ├── spectre.lua                # Search & replace
│       ├── toggleterm.lua             # Terminal integration
│       ├── treesitter-textobjects.lua # Text objects
│       ├── which-key.lua              # Keymap help
│       └── config/                    # Advanced configurations
│           ├── dap.lua                # Debug adapter setup
│           ├── lsp.lua                # LSP server configs
│           ├── nvim-cmp.lua           # Completion engine
│           ├── nvim-tree.lua          # File explorer
│           └── telescope.lua          # Fuzzy finder
└── README_formatters.md               # Formatting documentation
```

## 🔧 Language Support

### Built-in Support
- **Python** - LSP (Pyright), formatting (isort + ruff), debugging (DAP)
- **JavaScript/TypeScript** - LSP, formatting (Prettier), syntax highlighting
- **Lua** - LSP (lua_ls), formatting (stylua), Neovim API completion
- **Go** - LSP, formatting (gofmt + goimports)
- **Rust** - LSP, formatting (rustfmt)
- **C/C++** - LSP, formatting (clang-format)
- **Shell** - Formatting (shfmt), syntax highlighting
- **Web** - HTML, CSS, JSON, YAML, Markdown formatting

### Adding New Languages
1. **LSP Server**: Add to `lua/custom/lsp_config.lua` servers table
2. **Formatter**: Add to `lua/custom/formatters.lua` formatters_by_ft table
3. **Install Tools**: Use `:Mason` to install language tools
4. **Syntax**: Treesitter auto-installs parsers as needed

## 🎨 Customization

### Change Colorscheme
```lua
-- Edit lua/custom/plugins/colorscheme.lua
-- Change priority values to set default theme
```

### Add Custom Keymaps
```lua
-- Add to lua/custom/keymaps.lua
vim.keymap.set('n', '<leader>custom', ':echo "Hello"<CR>', { desc = 'Custom command' })
```

### Add New Formatters
```lua
-- Edit lua/custom/formatters.lua
M.formatters_by_ft = {
  -- Add your language
  newlang = { 'formatter-name' },
}
```

### Configure LSP Servers
```lua
-- Edit lua/custom/lsp_config.lua
local servers = {
  -- Add new server
  new_ls = {
    settings = {
      -- server-specific settings
    }
  }
}
```

## 🔧 Plugin Highlights

### Core Productivity
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Fast plugin manager
- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[which-key](https://github.com/folke/which-key.nvim)** - Keymap helper

### Development Tools
- **[LSP Config](https://github.com/neovim/nvim-lspconfig)** - Language servers
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** - Debug adapter

### Navigation & UI
- **[Hop](https://github.com/smoka7/hop.nvim)** - Fast cursor movement
- **[Flash](https://github.com/folke/flash.nvim)** - Enhanced search
- **[Harpoon](https://github.com/ThePrimeagen/harpoon)** - File bookmarks
- **[lualine](https://github.com/nvim-lualine/lualine.nvim)** - Status line

### Git & Terminal
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Git integration
- **[ToggleTerm](https://github.com/akinsho/toggleterm.nvim)** - Terminal
- **[Trouble](https://github.com/folke/trouble.nvim)** - Diagnostics
- **[Spectre](https://github.com/nvim-pack/nvim-spectre)** - Search/replace

## 🛠️ Troubleshooting

### Health Checks
```vim
:checkhealth          # Overall Neovim health
:checkhealth telescope # Specific plugin health
:checkhealth lsp       # LSP configuration
```

### Common Commands
```vim
:Lazy              # Plugin manager
:Lazy sync         # Update all plugins
:Mason             # Tool installer
:ConformInfo       # Formatter status
:LspInfo           # LSP server status
:Telescope         # Available pickers
:WhichKey          # Show keymaps
```

### Performance Issues
```vim
:Lazy profile      # Plugin load times
:LspRestart        # Restart language servers
:TSUpdate          # Update Treesitter parsers
```

### Reset Configuration
```bash
# Remove plugin data
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

# Restart Neovim to reinstall
nvim
```

## 🤝 Contributing

This is a personal configuration, but feel free to:
- Fork and adapt for your needs
- Report issues or suggestions
- Share improvements or optimizations

## 📚 Resources

- **[Neovim Documentation](https://neovim.io/doc/user/)**
- **[Lazy.nvim Guide](https://lazy.folke.io/)**
- **[LSP Configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)**
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**
- **[Mason Tool Installer](https://github.com/williamboman/mason.nvim)**

---

## 📄 License

This configuration is provided as-is under the MIT License. See the individual plugin repositories for their respective licenses.

**Happy coding!** 🎉

### Add Formatters
Edit `lua/custom/formatters.lua` - add languages to `formatters_by_ft`.

### Configure LSP
Edit `lua/custom/lsp_config.lua` - add servers to ensure_installed.

## 📂 Structure

```
nvim/
├── init.lua                     # Entry point
├── lua/custom/
│   ├── keymaps.lua             # All keybindings
│   ├── vim_config.lua          # Vim settings
│   ├── formatters.lua          # Formatter configs
│   └── plugins/                # Plugin configurations
└── README_formatters.md        # Formatting guide
```

## 🔧 Language Support

**Built-in**: Lua, Python, JavaScript/TypeScript, Go, Rust, C/C++, and more.

**Adding new languages**:
1. Add LSP server in `lsp_config.lua`
2. Add formatter in `formatters.lua`
3. Install tools via `:Mason`

## 🛠️ Troubleshooting

```vim
:checkhealth    # Check system health
:Lazy sync      # Update plugins
:Mason          # Install/manage tools
:ConformInfo    # Formatter status
:LspInfo        # LSP server status
```

## 📈 Philosophy

This configuration prioritizes:
- **Manual formatting** (no auto-format on save by default)
- **Productivity** with intelligent keybindings
- **Modularity** with organized file structure
- **Performance** with lazy loading
- **Simplicity** while maintaining power

---

**Happy coding! 🎉**

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

### Install Envym

#### Clone it

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/happyApe/envym.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/happyApe/envym.git %userprofile%\AppData\Local\nvim\
```

If you're using `powershell.exe`

```
git clone https://github.com/happyApe/envym.git $env:USERPROFILE\AppData\Local\nvim\
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.


#### Examples of adding popularly requested plugins

NOTE: You'll need to uncomment the line in the init.lua that turns on loading custom plugins.

<details>
  <summary>Adding autopairs</summary>

This will automatically install [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
and enable it on startup. For more information, see documentation for
[lazy.nvim](https://github.com/folke/lazy.nvim).

In the file: `lua/custom/plugins/autopairs.lua`, add:

```lua
-- File: lua/custom/plugins/autopairs.lua

return {
  "windwp/nvim-autopairs",
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require("nvim-autopairs").setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
```

</details>
<details>
  <summary>Adding a file tree plugin</summary>

This will install the tree plugin and add the command `:Neotree` for you.
For more information, see the documentation at
[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim).

In the file: `lua/custom/plugins/filetree.lua`, add:

```lua
-- File: lua/custom/plugins/filetree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {}
  end,
}
```

</details>

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the 
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>

