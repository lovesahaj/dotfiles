Util = require("lazyvim.util")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
  {
    "rebelot/kanagawa.nvim",
    keys = {
      { "<leader>th", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
    },
  },
  {
    -- Custom Theme inspired from original VIM
    "EdenEast/nightfox.nvim", -- colorscheme
    opts = {
      options = {
        styles = {
          comments = "italic",
          functions = "bold",
          -- constants = "italic",
          -- keywords = "standout",
        },
      },
      specs = {
        all = {
          syntax = {
            keyword = "#FFFA3E",
            func = "#00FFFF",
            string = "#EE7EF8",
            number = "#9300FF",
            conditional = "#E77C0C",
            variable = "#FFFFFF",
            operator = "#FFFA3E",
            comment = "#56BD37",
          },
        },
      },
      palettes = {
        carbonfox = {
          bg1 = "#000000", -- Pure Black background babyy
          sel0 = "#3e4a5b", -- Popup bg, visual selection bg
          sel1 = "#4f6074", -- Popup sel bg, search bg
          -- comment = "#E1C16E",
        },
      },
    },
  },
}
