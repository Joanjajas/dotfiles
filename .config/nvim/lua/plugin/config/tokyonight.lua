local tokyonight_present, tokyonight = pcall(require, "tokyonight")
local log = require("core.log")

if not tokyonight_present then
  return log.warn("Module 'tokyonight' is not installed or could not be loaded")
end

local config = {
  style = "night",
  transparent = true,

  on_colors = function(colors)
    colors.bg = "#0e131f"
    colors.bg_float = colors.bg
    colors.bg_sidebar = colors.bg
    colors.bg_statusline = colors.bg
    colors.border = colors.bg
  end,

  on_highlights = function(highlight, colors)
    highlight.TabLineFill = {
      bg = colors.bg,
    }

    highlight.TabLineSel = {
      bg = colors.bg,
    }
  end,
}

tokyonight.setup(config)
