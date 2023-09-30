local nvimtree = require("nvim-tree")
local api = require("nvim-tree.api")

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

  renderer = {
    root_folder_label = false,
  },

  view = {
    adaptive_size = true,
    cursorline = false,
    side = "right",

    width = {
      max = 40,
    },
  },

  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "<BS>", ":q!<CR>", { buffer = bufnr })
  end,
}

nvimtree.setup(config)
