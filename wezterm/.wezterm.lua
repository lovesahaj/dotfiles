local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Your existing color scheme
config.color_schemes = {
  ["Monokai Pure Black"] = {
    background = "#000000",
    foreground = "#f8f8f2",
    cursor_bg = "#f8f8f2",
    cursor_fg = "#000000",
    selection_bg = "#f8f8f2",
    selection_fg = "#000000",

    ansi = {
      "#000000", -- color0 (black)
      "#f92672", -- color1 (red)
      "#a6e22e", -- color2 (green)
      "#e6db74", -- color3 (yellow)
      "#66d9ef", -- color4 (blue)
      "#fd971f", -- color5 (magenta)
      "#ae81ff", -- color6 (cyan)
      "#f8f8f2", -- color7 (white)
    },
    brights = {
      "#75715e", -- color8 (bright black)
      "#f92672", -- color9 (bright red)
      "#a6e22e", -- color10 (bright green)
      "#e6db74", -- color11 (bright yellow)
      "#66d9ef", -- color12 (bright blue)
      "#fd971f", -- color13 (bright magenta)
      "#ae81ff", -- color14 (bright cyan)
      "#f8f8f2", -- color15 (bright white)
    },

    -- WezTerm-specific properties for tabs and title bar
    tab_bar = {
      active_tab = {
        bg_color = "#75715e",
        fg_color = "#000000",
      },
      inactive_tab = {
        bg_color = "#000000",
        fg_color = "#75715e",
      },
    },
  },
}

-- Your existing display settings
config.color_scheme = "Monokai Pure Black"
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 16
config.font = wezterm.font("Agave Nerd Font")

-- Leader key setup (backtick like your tmux prefix)
config.leader = { key = "`", mods = "", timeout_milliseconds = 2000 }

-- Key bindings combining your existing keys with tmux equivalents
config.keys = {
  -- Your existing key binding
  { key = "Enter", mods = "SHIFT", action = act.SendString("\x1b\r") },

  -- TMUX-EQUIVALENT PREFIX BINDINGS (using LEADER)

  -- `` (double backtick): last window/tab
  { key = "`", mods = "LEADER", action = act.ActivateLastTab },

  -- `e: send literal backtick
  { key = "e", mods = "LEADER", action = act.SendKey({ key = "`" }) },

  -- `r: reload configuration
  { key = "r", mods = "LEADER", action = act.ReloadConfiguration },

  -- PANE SPLITTING
  { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "_", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- PANE NAVIGATION (hjkl vim-style)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- PANE SWAPPING
  { key = ">", mods = "LEADER|SHIFT", action = act.RotatePanes("Clockwise") },
  { key = "<", mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },

  -- PANE RESIZING (HJKL)
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 2 }) },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 2 }) },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 2 }) },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 2 }) },

  -- PANE ZOOM
  { key = "+", mods = "LEADER|SHIFT", action = act.TogglePaneZoomState },

  -- TAB/WINDOW MANAGEMENT
  { key = "Tab", mods = "LEADER", action = act.ActivateLastTab },

  -- COPY MODE
  { key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },

  -- NON-PREFIX BINDINGS
  { key = "h", mods = "CTRL", action = act.ActivateTabRelative(-1) },
  { key = "l", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "H", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "L", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },
}

-- TAB SWITCHING BY NUMBER (like tmux `1, `2, etc.)
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1), -- WezTerm uses 0-based indexing
  })
end

-- Add `0 to go to tab 10 (last tab in most cases)
table.insert(config.keys, {
  key = "0",
  mods = "LEADER",
  action = act.ActivateTab(9), -- Tab 10 (0-based index 9)
})

-- Copy mode key bindings (vi-style like your tmux config)
config.key_tables = {
  copy_mode = {
    -- v: start cell selection (like visual mode in vim)
    { key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },

    -- V: start line selection (like visual line mode in vim)
    { key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },

    -- Ctrl+V: start block selection (like visual block mode in vim)
    { key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

    -- y: copy selection and exit copy mode
    {
      key = "y",
      mods = "NONE",
      action = act.Multiple({
        { CopyTo = "ClipboardAndPrimarySelection" },
        act.ScrollToBottom,
        act.CopyMode("Close"),
      }),
    },

    -- Escape: exit copy mode
    {
      key = "Escape",
      mods = "NONE",
      action = act.Multiple({
        act.ScrollToBottom,
        act.CopyMode("Close"),
      }),
    },

    -- Movement keys (vi-style)
    { key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
    { key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
    { key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
    { key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

    -- H/L: start/end of line (matching your tmux config)
    { key = "H", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLine") },
    { key = "L", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
  },
}

-- and finally, return the configuration to wezterm
return config
