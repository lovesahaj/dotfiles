# Graph Report - .  (2026-04-21)

## Corpus Check
- Corpus is ~17,393 words - fits in a single context window. You may not need a graph.

## Summary
- 124 nodes · 85 edges · 45 communities detected
- Extraction: 74% EXTRACTED · 22% INFERRED · 4% AMBIGUOUS · INFERRED: 19 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_LSP Navigation Stack|LSP Navigation Stack]]
- [[_COMMUNITY_Completion and Linting|Completion and Linting]]
- [[_COMMUNITY_Debugging Workflow|Debugging Workflow]]
- [[_COMMUNITY_Monokai Theme Engine|Monokai Theme Engine]]
- [[_COMMUNITY_Formatting Control|Formatting Control]]
- [[_COMMUNITY_Terminal Integration|Terminal Integration]]
- [[_COMMUNITY_Manual Control Philosophy|Manual Control Philosophy]]
- [[_COMMUNITY_Formatter Utilities|Formatter Utilities]]
- [[_COMMUNITY_Code Folding|Code Folding]]
- [[_COMMUNITY_DAP Event Hooks|DAP Event Hooks]]
- [[_COMMUNITY_License and Notices|License and Notices]]
- [[_COMMUNITY_Python DAP Bootstrap|Python DAP Bootstrap]]
- [[_COMMUNITY_GitHub PR Workflow|GitHub PR Workflow]]
- [[_COMMUNITY_LSP Floating UI|LSP Floating UI]]
- [[_COMMUNITY_Clipboard Fallback|Clipboard Fallback]]
- [[_COMMUNITY_Gitsigns Mappings|Gitsigns Mappings]]
- [[_COMMUNITY_Toggleterm Key Hooks|Toggleterm Key Hooks]]
- [[_COMMUNITY_Nvim-Tree Attach|Nvim-Tree Attach]]
- [[_COMMUNITY_Theme Highlight Helper|Theme Highlight Helper]]
- [[_COMMUNITY_Plugin Bootstrap|Plugin Bootstrap]]
- [[_COMMUNITY_Project Search|Project Search]]
- [[_COMMUNITY_Colorscheme Selection|Colorscheme Selection]]
- [[_COMMUNITY_Version Requirements|Version Requirements]]
- [[_COMMUNITY_Global Keymaps File|Global Keymaps File]]
- [[_COMMUNITY_Autopairs File|Autopairs File]]
- [[_COMMUNITY_Indent Guides File|Indent Guides File]]
- [[_COMMUNITY_Lint File|Lint File]]
- [[_COMMUNITY_Plugin Registry File|Plugin Registry File]]
- [[_COMMUNITY_Treesitter Textobjects File|Treesitter Textobjects File]]
- [[_COMMUNITY_Spectre File|Spectre File]]
- [[_COMMUNITY_UFO File|UFO File]]
- [[_COMMUNITY_Lualine File|Lualine File]]
- [[_COMMUNITY_Octo File|Octo File]]
- [[_COMMUNITY_Colorscheme File|Colorscheme File]]
- [[_COMMUNITY_Which-Key File|Which-Key File]]
- [[_COMMUNITY_Telescope File|Telescope File]]
- [[_COMMUNITY_Nvim-Cmp File|Nvim-Cmp File]]
- [[_COMMUNITY_LSP Override File|LSP Override File]]
- [[_COMMUNITY_DAP Config File|DAP Config File]]
- [[_COMMUNITY_LSP Border Override|LSP Border Override]]
- [[_COMMUNITY_Diagnostics Toggle|Diagnostics Toggle]]
- [[_COMMUNITY_OSC52 Clipboard|OSC52 Clipboard]]
- [[_COMMUNITY_Textobjects Setup|Textobjects Setup]]
- [[_COMMUNITY_Statusline Setup|Statusline Setup]]
- [[_COMMUNITY_Productivity Goal|Productivity Goal]]

## God Nodes (most connected - your core abstractions)
1. `require_all_in_directory()` - 5 edges
2. `Conform Plugin Spec` - 5 edges
3. `Required Custom Modules` - 5 edges
4. `Monokai True Dark Colorscheme` - 5 edges
5. `Telescope Setup Config` - 4 edges
6. `Nvim-cmp Runtime Setup` - 4 edges
7. `Debug Keymaps` - 4 edges
8. `Toggleterm Setup Config` - 3 edges
9. `Dedicated UFO Setup` - 3 edges
10. `DAP Event Listeners` - 3 edges

## Surprising Connections (you probably didn't know these)
- `Integrated Debugging Feature` --semantically_similar_to--> `Debug Keymaps`  [INFERRED] [semantically similar]
  README.md → lua/custom/plugins/config/dap.lua
- `Debugging Shortcut Reference` --semantically_similar_to--> `Debug Keymaps`  [INFERRED] [semantically similar]
  KEYBINDINGS.md → lua/custom/plugins/config/dap.lua
- `Auto Load Config Directory Pattern` --conceptually_related_to--> `DAP Event Listeners`  [INFERRED]
  CLAUDE.md → lua/custom/plugins/config/dap.lua
- `Python Debugging With Debugpy` --conceptually_related_to--> `Debugpy Adapter Ensure Installed`  [INFERRED]
  CLAUDE.md → lua/custom/plugins/config/dap.lua
- `Manual Control Philosophy` --semantically_similar_to--> `Manual Control Over Automatic Behavior`  [INFERRED] [semantically similar]
  README.md → CLAUDE.md

## Hyperedges (group relationships)
- **Manual Formatting Control Plane** — plugins_init_conform_plugin, formatters_formatters_by_ft, formatters_custom_formatters, keymaps_manual_format_binding, keymaps_format_toggle [INFERRED 0.88]
- **LSP Navigation Through Telescope** — lsp_config_lsp_attach_autocmd, lsp_config_lsp_keymaps, plugins_telescope_setup, lsp_config_capabilities_merge, plugins_init_nvim_cmp_plugin [INFERRED 0.84]
- **Terminal Command Surface** — plugins_toggleterm_setup, plugins_toggleterm_global_functions, plugins_which_key_terminal_keymaps, plugins_init_toggleterm_inline_plugin [INFERRED 0.83]
- **DAP Debug Flow Composition** — dap_dap_listeners, dap_dapui_auto_open, dap_dapui_auto_close, dap_debug_keymaps, dap_mason_nvim_dap_setup [INFERRED 0.88]
- **Monokai Theme Construction** — monokai_true_dark_colorscheme, monokai_true_dark_palette, monokai_true_dark_highlight_helper, monokai_true_dark_treesitter_links, monokai_true_dark_terminal_colors [EXTRACTED 1.00]
- **Manual Control Principle Across Docs** — readme_manual_control_philosophy, readme_full_manual_formatting_default, claude_manual_control_philosophy, keybindings_format_before_commit_tip [INFERRED 0.90]

## Communities

### Community 0 - "LSP Navigation Stack"
Cohesion: 0.15
Nodes (11): require_all_in_directory(), LSP Attach Autocommand, Buffer-local LSP Keymaps, Mason Tool Installation Pipeline, LSP Server Definitions, Telescope Plugin Spec, Pyright Dedicated Override, Nvim-tree On-Attach Mapping Hook (+3 more)

### Community 1 - "Completion and Linting"
Cohesion: 0.18
Nodes (11): Autopairs Completion Hook, Gitsigns Buffer Keymaps, Indent-Blankline Plugin Spec, Lint Autocommand Runner, Linter Map By Filetype, LSP Capabilities Merge, Base Gitsigns Plugin Spec, Nvim-cmp Plugin Spec (+3 more)

### Community 2 - "Debugging Workflow"
Cohesion: 0.18
Nodes (11): Python Debugging With Debugpy, Debug Keybinding Convention, CodeLLDB Adapter Ensure Installed, Debug Keymaps, Debugpy Adapter Ensure Installed, Mason Nvim DAP Setup, DAP REPL Open Command, DAP Widget Hover Preview Frames Scopes (+3 more)

### Community 3 - "Monokai Theme Engine"
Cohesion: 0.33
Nodes (7): Monokai True Dark Colorscheme, Diagnostic Highlight Groups, Highlight Helper Function, Color Palette Table, Plugin Highlight Integrations, Terminal ANSI Color Mapping, Treesitter Highlight Link Map

### Community 4 - "Formatting Control"
Cohesion: 0.4
Nodes (6): Custom Formatter Definitions, Disable LSP Formatting List, Formatter Map By Filetype, Format-on-save Toggle Keybinding, Manual Format Keybinding, Conform Plugin Spec

### Community 5 - "Terminal Integration"
Cohesion: 0.33
Nodes (6): Inline Toggleterm Plugin Spec, Inline Which-Key Plugin Spec, Toggleterm Global Helper Functions, Toggleterm Setup Config, Terminal Keymap Autocmd, Which-Key Terminal Mappings

### Community 6 - "Manual Control Philosophy"
Cohesion: 0.4
Nodes (6): Manual Control Over Automatic Behavior, Manual Control Design Rationale, Format Before Commit Tip, Manual Formatting By Default, Manual Control Philosophy, Format When You Want Debug When You Need Rationale

### Community 7 - "Formatter Utilities"
Cohesion: 0.5
Nodes (0): 

### Community 8 - "Code Folding"
Cohesion: 0.5
Nodes (4): Inline UFO Plugin Spec, UFO Fold Virtual Text Handler, Peek Fold Or LSP Hover, Dedicated UFO Setup

### Community 9 - "DAP Event Hooks"
Cohesion: 0.5
Nodes (4): Auto Load Config Directory Pattern, DAP Event Listeners, DAP UI Auto Close, DAP UI Auto Open

### Community 10 - "License and Notices"
Cohesion: 0.5
Nodes (4): MIT License, As Is Warranty Disclaimer, README Full MIT License Reference, README MIT License Statement

### Community 11 - "Python DAP Bootstrap"
Cohesion: 1.0
Nodes (3): DAP Python Setup, DapPythonRefresh Command, Dynamic Python Path Resolution

### Community 12 - "GitHub PR Workflow"
Cohesion: 0.67
Nodes (3): Octo Plugin Setup, Octo Treesitter Markdown Registration, Which-Key Octo Mappings

### Community 13 - "LSP Floating UI"
Cohesion: 1.0
Nodes (0): 

### Community 14 - "Clipboard Fallback"
Cohesion: 1.0
Nodes (0): 

### Community 15 - "Gitsigns Mappings"
Cohesion: 1.0
Nodes (0): 

### Community 16 - "Toggleterm Key Hooks"
Cohesion: 1.0
Nodes (0): 

### Community 17 - "Nvim-Tree Attach"
Cohesion: 1.0
Nodes (0): 

### Community 18 - "Theme Highlight Helper"
Cohesion: 1.0
Nodes (0): 

### Community 19 - "Plugin Bootstrap"
Cohesion: 1.0
Nodes (2): Lazy Plugin Bootstrap, Primary Plugin Registry

### Community 20 - "Project Search"
Cohesion: 1.0
Nodes (2): Spectre Keymaps, Spectre Setup Config

### Community 21 - "Colorscheme Selection"
Cohesion: 1.0
Nodes (2): Default Colorscheme Selection, Theme Collection

### Community 22 - "Version Requirements"
Cohesion: 1.0
Nodes (2): Neovim 0.10 Plus Requirement, Neovim 0.9 Plus Requirement

### Community 23 - "Global Keymaps File"
Cohesion: 1.0
Nodes (0): 

### Community 24 - "Autopairs File"
Cohesion: 1.0
Nodes (0): 

### Community 25 - "Indent Guides File"
Cohesion: 1.0
Nodes (0): 

### Community 26 - "Lint File"
Cohesion: 1.0
Nodes (0): 

### Community 27 - "Plugin Registry File"
Cohesion: 1.0
Nodes (0): 

### Community 28 - "Treesitter Textobjects File"
Cohesion: 1.0
Nodes (0): 

### Community 29 - "Spectre File"
Cohesion: 1.0
Nodes (0): 

### Community 30 - "UFO File"
Cohesion: 1.0
Nodes (0): 

### Community 31 - "Lualine File"
Cohesion: 1.0
Nodes (0): 

### Community 32 - "Octo File"
Cohesion: 1.0
Nodes (0): 

### Community 33 - "Colorscheme File"
Cohesion: 1.0
Nodes (0): 

### Community 34 - "Which-Key File"
Cohesion: 1.0
Nodes (0): 

### Community 35 - "Telescope File"
Cohesion: 1.0
Nodes (0): 

### Community 36 - "Nvim-Cmp File"
Cohesion: 1.0
Nodes (0): 

### Community 37 - "LSP Override File"
Cohesion: 1.0
Nodes (0): 

### Community 38 - "DAP Config File"
Cohesion: 1.0
Nodes (0): 

### Community 39 - "LSP Border Override"
Cohesion: 1.0
Nodes (1): LSP Floating Border Override

### Community 40 - "Diagnostics Toggle"
Cohesion: 1.0
Nodes (1): Diagnostics Toggle Keybinding

### Community 41 - "OSC52 Clipboard"
Cohesion: 1.0
Nodes (1): OSC52 Clipboard Fallback

### Community 42 - "Textobjects Setup"
Cohesion: 1.0
Nodes (1): Treesitter Textobjects Setup

### Community 43 - "Statusline Setup"
Cohesion: 1.0
Nodes (1): Lualine Setup

### Community 44 - "Productivity Goal"
Cohesion: 1.0
Nodes (1): Development Productivity Goal

## Ambiguous Edges - Review These
- `LSP Server Definitions` → `Pyright Dedicated Override`  [AMBIGUOUS]
  lua/custom/plugins/config/lsp.lua · relation: conceptually_related_to
- `Inline UFO Plugin Spec` → `Dedicated UFO Setup`  [AMBIGUOUS]
  lua/custom/plugins/init.lua · relation: conceptually_related_to
- `Neovim 0.9 Plus Requirement` → `Neovim 0.10 Plus Requirement`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **51 isolated node(s):** `Lazy Plugin Bootstrap`, `LSP Floating Border Override`, `LSP Capabilities Merge`, `Mason Tool Installation Pipeline`, `Manual Format Keybinding` (+46 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `LSP Floating UI`** (2 nodes): `vim.lsp.util.open_floating_preview()`, `lsp_config.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Clipboard Fallback`** (2 nodes): `vim_config.lua`, `use_osc52()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Gitsigns Mappings`** (2 nodes): `map()`, `gitsigns.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Toggleterm Key Hooks`** (2 nodes): `toggleterm.lua`, `_G.set_terminal_keymaps()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Nvim-Tree Attach`** (2 nodes): `nvim-tree.lua`, `my_on_attach()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Theme Highlight Helper`** (2 nodes): `monokai_true_dark.lua`, `hl()`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Plugin Bootstrap`** (2 nodes): `Lazy Plugin Bootstrap`, `Primary Plugin Registry`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Project Search`** (2 nodes): `Spectre Keymaps`, `Spectre Setup Config`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Colorscheme Selection`** (2 nodes): `Default Colorscheme Selection`, `Theme Collection`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Version Requirements`** (2 nodes): `Neovim 0.10 Plus Requirement`, `Neovim 0.9 Plus Requirement`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Global Keymaps File`** (1 nodes): `keymaps.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Autopairs File`** (1 nodes): `autopairs.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Indent Guides File`** (1 nodes): `indent_line.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Lint File`** (1 nodes): `lint.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Plugin Registry File`** (1 nodes): `init.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Treesitter Textobjects File`** (1 nodes): `treesitter-textobjects.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Spectre File`** (1 nodes): `spectre.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `UFO File`** (1 nodes): `nvim-ufo.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Lualine File`** (1 nodes): `lualine.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Octo File`** (1 nodes): `octo.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Colorscheme File`** (1 nodes): `colorscheme.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Which-Key File`** (1 nodes): `which-key.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Telescope File`** (1 nodes): `telescope.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Nvim-Cmp File`** (1 nodes): `nvim-cmp.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `LSP Override File`** (1 nodes): `lsp.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `DAP Config File`** (1 nodes): `dap.lua`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `LSP Border Override`** (1 nodes): `LSP Floating Border Override`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Diagnostics Toggle`** (1 nodes): `Diagnostics Toggle Keybinding`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `OSC52 Clipboard`** (1 nodes): `OSC52 Clipboard Fallback`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Textobjects Setup`** (1 nodes): `Treesitter Textobjects Setup`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Statusline Setup`** (1 nodes): `Lualine Setup`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Productivity Goal`** (1 nodes): `Development Productivity Goal`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `LSP Server Definitions` and `Pyright Dedicated Override`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **What is the exact relationship between `Inline UFO Plugin Spec` and `Dedicated UFO Setup`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **What is the exact relationship between `Neovim 0.9 Plus Requirement` and `Neovim 0.10 Plus Requirement`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `require_all_in_directory()` connect `LSP Navigation Stack` to `Completion and Linting`?**
  _High betweenness centrality (0.020) - this node is a cross-community bridge._
- **Why does `Nvim-cmp Runtime Setup` connect `Completion and Linting` to `LSP Navigation Stack`?**
  _High betweenness centrality (0.016) - this node is a cross-community bridge._
- **Why does `Required Custom Modules` connect `Completion and Linting` to `LSP Navigation Stack`?**
  _High betweenness centrality (0.014) - this node is a cross-community bridge._
- **What connects `Lazy Plugin Bootstrap`, `LSP Floating Border Override`, `LSP Capabilities Merge` to the rest of the system?**
  _51 weakly-connected nodes found - possible documentation gaps or missing edges._