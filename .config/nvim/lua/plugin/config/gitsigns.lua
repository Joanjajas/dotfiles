local gitsigns_present, gitsigns = pcall(require, "gitsigns")
local log = require("core.log")

if not gitsigns_present then
  return log.warn("Module 'gitsigns' is not installed or could not be loaded")
end

local config = {
  numhl = true,

  signs = {
    delete = { text = "-" },
    topdelete = { text = "-" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },

  current_line_blame_opts = {
    virt_text_pos = "right_align",
    delay = 100,
  },
}

gitsigns.setup(config)
