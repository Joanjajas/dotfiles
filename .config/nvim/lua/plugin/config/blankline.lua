local blankline = require("ibl")

local config = {
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,

  scope = {
    enabled = false,
  },

  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "neo-tree",
    "NvimTree",
    "",
  },
}

blankline.setup(config)
