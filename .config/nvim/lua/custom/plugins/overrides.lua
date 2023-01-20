local M = {}

M.blankline = {
  show_current_context = false,
}

M.cmp = {
  preselect = false,
}

M.buffline = {
  tabufline = {
    enabled = false,
  },
}

M.nvimtree = {
  view = {
    side = "right",

    mappings = {
      list = {
        { key = { "<BS>" }, cb = ":q!<CR>", mode = "n" },
      },
    },
  },
}

return M
