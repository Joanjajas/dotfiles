local telescope = require("telescope")

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
telescope.load_extension("fzf")
