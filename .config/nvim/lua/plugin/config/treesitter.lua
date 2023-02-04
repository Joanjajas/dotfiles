local treesitter_present, treesitter = pcall(require, "nvim-treesitter.configs")
local log = require("core.log")

if not treesitter_present then
  return log.warn("Module 'nvim-treesitter' is not installed or could not be loaded")
end

local config = {
  highlight = {
    enable = true,
  },
}

treesitter.setup(config)
