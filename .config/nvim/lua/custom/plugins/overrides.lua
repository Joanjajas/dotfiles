local M = {}

M.blankline = {
  show_current_context = false,
  show_first_indent_level = true,

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
    "nvdash",
    "",
  },
}

M.cmp = {
  preselect = false,
}

M.nvimtree = {
  open_on_setup = true,
  open_on_setup_file = true,
  ignore_buffer_on_setup = true,
  ignore_ft_on_setup = { "nvdash" },

  view = {
    side = "right",
    adaptive_size = true,
    preserve_window_proportions = true,

    width = {
      max = 40,
    },

    mappings = {
      list = {
        { key = { "<BS>" }, cb = ":q!<CR>", mode = "n" },
      },
    },
  },
}

return M
