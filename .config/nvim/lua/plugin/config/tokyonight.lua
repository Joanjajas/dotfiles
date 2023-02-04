local tokyonight_present, tokyonight = pcall(require, "tokyonight")
local log = require("core.log")

if not tokyonight_present then
  return log.warn("Module 'tokyonight' is not installed or could not be loaded")
end

local config = {
  style = "night",
}

tokyonight.setup(config)
