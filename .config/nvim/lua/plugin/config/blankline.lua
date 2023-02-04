local blankline_present, blankline = pcall(require, "indent_blankline")
local log = require("core.log")

if not blankline_present then
  return log.warn("Module 'indent_blankline' is not installed or could not be loaded")
end

local config = {
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,

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
