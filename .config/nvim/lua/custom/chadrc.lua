local M = {}

local highlights = require "custom.highlights"

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

M.ui = {
  theme = "radium",
  hl_add = highlights.add,
}

return M
