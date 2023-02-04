local which_key_present, which_key = pcall(require, "which-key")
local log = require("core.log")

if not which_key_present then
  return log.warn("Module 'which-key' is not installed or could not be loaded")
end

local config = {}

which_key.setup(config)
