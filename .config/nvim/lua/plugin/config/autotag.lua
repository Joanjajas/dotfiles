local autotag_present, mason = pcall(require, "nvim-ts-autotag")
local log = require("core.log")

if not autotag_present then
  return log.warn("Module 'nvim-ts-autotag' is not installed or could not be loaded")
end

local config = {}

mason.setup(config)
