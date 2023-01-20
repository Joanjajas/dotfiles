local M = {}

M.blankline = {
  show_current_context = false,
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "NvimTree",
    "",
  },
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
  open_on_setup_file = true,
  ignore_buffer_on_setup = true,

  view = {
    side = "right",
    preserve_window_proportions = true,

    mappings = {
      list = {
        { key = { "<BS>" }, cb = ":q!<CR>", mode = "n" },
      },
    },
  },
}

return M
