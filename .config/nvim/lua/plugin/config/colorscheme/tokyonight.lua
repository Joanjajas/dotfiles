local tokyonight_present, tokyonight = pcall(require, "tokyonight")
local log = require("core.log")

if not tokyonight_present then
  return log.warn("Module 'tokyonight' is not installed or could not be loaded")
end

local config = {
  style = "night",
  transparent = true,

  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },

  on_highlights = function(highlight, colors)
    highlight.TabLine = {
      bg = "none",
    }

    highlight.TabLineFill = {
      bg = "none",
    }

    highlight.TabLineSel = {
      bg = "none",
    }
  end,
}

tokyonight.setup(config)
