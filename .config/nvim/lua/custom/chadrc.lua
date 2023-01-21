local M = {}

local highlights = require "custom.highlights"

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

M.ui = {
  theme = "radium",
  hl_add = highlights.add,

  tabufline = {
    enabled = false,
  },

  nvdash = {
    load_on_startup = true,

    buttons = {
      { "  File Explorer", "Spc e  ", "NvimTreeFocus" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
    },
  },
}

return M
