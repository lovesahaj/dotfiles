# 🎯 Neovim Quick Reference

## Essential Keybindings (Leader: `<Space>`)

### 📁 File Management
```
<leader>e     → Toggle file explorer
\             → Find current file in tree
<leader>sf    → Find files (Telescope)
<leader>sg    → Live grep search
<leader>sw    → Search current word
<leader>sr    → Resume last search
```

### ✏️ Code Editing
```
<leader>fw    → Format buffer/selection
<leader>fi    → Show formatter info
<leader>ft    → Toggle auto-format on save
gcc           → Comment line
gc (visual)   → Comment selection
```

### 🐛 Debugging
```
<F5>          → Start/Continue debugging
<F10>         → Step over
<F11>         → Step into
<F12>         → Step out
<leader>b     → Toggle breakpoint
<leader>du    → Toggle debug UI
```

### 🌳 Git
```
<leader>gs    → Stage hunk
<leader>gr    → Reset hunk
<leader>gp    → Preview hunk
<leader>gb    → Blame line
<leader>tg    → Open Lazygit
]c / [c       → Next/prev git change
```

### 🖥️ Terminal
```
<Ctrl-\>      → Toggle terminal
<leader>tf    → Float terminal
<leader>th    → Horizontal terminal
<leader>tv    → Vertical terminal
<Esc><Esc>    → Exit terminal mode
```

### 🚀 Navigation
```
<leader>H     → Hop to word
]d / [d       → Next/prev diagnostic
<leader>de    → Show diagnostic details
gd            → Go to definition
gr            → Go to references
K             → Hover documentation
```

### 🔍 Search & Replace
```
<leader>sp    → Toggle Spectre (search/replace)
<leader>sw    → Search current word (Spectre)
/             → Search in buffer
*             → Search word under cursor
n / N         → Next/prev search result
```

### 📋 Copy/Paste
```
gA            → Copy entire buffer to clipboard
gY            → Copy entire buffer (internal)
"+y           → Copy to system clipboard
"+p           → Paste from system clipboard
```

### 🔄 Window Management
```
<leader>h/j/k/l → Move focus between windows
<Ctrl-w>s     → Horizontal split
<Ctrl-w>v     → Vertical split
<Ctrl-w>q     → Close window
<leader>qq    → Quit all
```

### 🎨 UI Toggles
```
<leader>td    → Toggle diagnostics
<leader>tb    → Toggle git blame
<leader>tD    → Toggle git deleted lines
```

## 📋 Useful Commands

### Plugin Management
```
:Lazy         → Plugin manager
:Lazy sync    → Update all plugins
:Mason        → Install LSP/formatters/linters
```

### Diagnostics & Health
```
:checkhealth  → Check Neovim health
:LspInfo      → LSP server status
:ConformInfo  → Formatter information
:Telescope    → Open Telescope menu
```

### Git Commands
```
:Gitsigns toggle_linehl    → Toggle line highlighting
:Git                       → Fugitive git interface
```

## 💡 Pro Tips

1. **Use `<leader>ss`** to open Telescope builtin menu for all available searches
2. **Press `?` in Telescope** to see all available keymaps
3. **Use `:WhichKey`** to see all available leader key combinations
4. **Format before committing** with `<leader>fw`
5. **Use visual mode with `<leader>fw`** to format only selected code
6. **Press `<leader>ft`** to temporarily enable auto-format for a session
7. **Use `<leader>sp`** for project-wide search and replace operations
8. **Open multiple terminals** with different directions for better workflow

## 🚀 Quick Setup Reminder

1. Open file: `<leader>sf`
2. Navigate: `<leader>H` or `/` to search
3. Edit code with LSP assistance
4. Format: `<leader>fw`
5. Debug: `<F5>` to start
6. Commit: `<leader>tg` for Lazygit
