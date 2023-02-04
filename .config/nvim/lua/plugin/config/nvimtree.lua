local nvimtree_present, nvimtree = pcall(require, "nvim-tree")
local log = require("core.log")

if not nvimtree_present then
  return log.warn("Module 'nvim-tree' is not installed or could not be loaded")
end

local config = {
  disable_netrw = true,
  hijack_cursor = true,

  update_focused_file = {
    enable = true,
  },

  git = {
    enable = false,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
  },

  view = {
    adaptive_size = true,
    cursorline = false,
    hide_root_folder = true,
    side = "right",

    width = {
      max = 40,
    },

    mappings = {
      list = {
        { key = { "<BS>" }, cb = ":q!<CR>" },
      },
    },
  },
}

nvimtree.setup(config)
