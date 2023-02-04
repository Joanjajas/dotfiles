local telescope_present, telescope = pcall(require, "telescope")
local log = require("core.log")

if not telescope_present then
  return log.warn("Module 'telescope' is not installed or could not be loaded")
end

local config = {
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },

  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },

      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
}

telescope.setup(config)
