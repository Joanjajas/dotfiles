local M = {}

M.blankline = {
  show_current_context = false,
}

M.cmp = {
  preselect = false,
}

M.ui = {
  tabufline = {
    enabled = false,
  },
}

M.nvimtree = {
  open_on_setup = true,

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
