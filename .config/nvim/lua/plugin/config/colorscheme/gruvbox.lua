local gruvbox_present, gruvbox = pcall(require, "gruvbox")
local log = require("core.log")

if not gruvbox_present then
  return log.warn("Module 'gruvbox' is not installed or could not be loaded")
end

local config = {
  transparent_mode = true,

  overrides = {
    Tabline = {
      bg = "none",
    },

    TablineFill = {
      bg = "none",
    },

    TablineSel = {
      bg = "none",
    },
  },
}

gruvbox.setup(config)
