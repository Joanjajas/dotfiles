local treesitter = require("nvim-treesitter.configs")

local config = {
  ensure_installed = {
    "python",
    "lua",
    "rust",
    "c",
    "vim",
    "vimdoc",
    "bash",
  },

  highlight = {
    enable = true,
  },
}

treesitter.setup(config)
