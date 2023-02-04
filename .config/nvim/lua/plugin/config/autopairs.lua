local autopairs_present, autopairs = pcall(require, "nvim-autopairs")
local log = require("core.log")

if not autopairs_present then
  return log.warn("Module 'nvim-autopairs' is not installed or could not be loaded")
end

local config = {}

autopairs.setup(config)
