local M = {}

M.blankline = {
  show_current_context = false,
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

M.buffline = {
  tabufline = {
    enabled = false,
  },
}

return M
