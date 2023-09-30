local gitsigns = require("gitsigns")

local config = {
  numhl = true,

  signs = {
    delete = { text = "-" },
    topdelete = { text = "-" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
}

gitsigns.setup(config)
