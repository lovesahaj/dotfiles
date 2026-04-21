# AGENTS.md

## Scope First
- This is a dotfiles repo managed as Stow packages. Top-level directories (`nvim`, `tmux`, `git`, `i3`, etc.) map to files under `$HOME`.
- There is no repo-wide build/test pipeline or CI workflow; validate only the area you changed.

## Deployment / Linking
- From repo root, use GNU Stow to link packages (example from `README.md`): `stow nvim git tmux`.
- Do not move files out of package directories; paths are intentionally shaped for Stow (for example `nvim/.config/nvim`).

## Neovim Is The Main Code Surface
- Canonical deep instructions live in `nvim/.config/nvim/CLAUDE.md`.
- Real entrypoint is `nvim/.config/nvim/init.lua`.
- Plugin specs live in `nvim/.config/nvim/lua/custom/plugins/init.lua`.
- Files in `nvim/.config/nvim/lua/custom/plugins/config/` are auto-loaded by `require_all_in_directory()` in `init.lua`; do not add manual `require(...)` lines for new files there.
- Effective Neovim requirement is 0.10+ (config uses `vim.lsp.config` and `vim.lsp.enable`).

## Neovim Conventions Easy To Break
- Formatting philosophy is manual-first: do not enable format-on-save by default unless explicitly requested.
- `<leader>fw` formats via Conform; `<leader>ft` is the runtime toggle for format-on-save.
- If plugin definitions change, run `:Lazy sync` and commit updated `nvim/.config/nvim/lazy-lock.json`.

## Neovim Verification Commands
- Format Lua before committing: `stylua nvim/.config/nvim/lua` (config: `nvim/.config/nvim/.stylua.toml`).
- Smoke-check inside Neovim: `:checkhealth`, `:LspInfo`, `:ConformInfo`.
- After LSP/formatter changes, verify/install tools with `:Mason`.
- For Python DAP changes, use `:DapPythonRefresh` to re-resolve interpreter.

## i3blocks Subtree (Compiled Blocklets)
- `i3blocks/.config/i3blocks` includes i3blocks-contrib-style blocklets; some are C binaries.
- Build all blocklets: `make` in `i3blocks/.config/i3blocks`.
- Install block scripts/binaries: `make install` (targets `~/.local/libexec/i3blocks`).
- `i3blocks/.config/i3blocks/config` calls `./brightness/bin/brightness`; if brightness code changes, rebuild that block.
