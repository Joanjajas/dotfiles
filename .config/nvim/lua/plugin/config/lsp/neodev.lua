local neodev_present, neodev = pcall(require, "neodev")
local log = require("core.log")

if not neodev_present then
  return log.warn("Module 'neodev' is not installed or could not be loaded")
end

local config = {}

neodev.setup(config)
