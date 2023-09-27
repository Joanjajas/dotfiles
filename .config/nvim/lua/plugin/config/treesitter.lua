local treesitter_present, treesitter = pcall(require, "nvim-treesitter.configs")
local log = require("core.log")

if not treesitter_present then
  return log.warn("Module 'nvim-treesitter' is not installed or could not be loaded")
end

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
