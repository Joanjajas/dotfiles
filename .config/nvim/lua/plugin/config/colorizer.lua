local colorizer_present, colorizer = pcall(require, "colorizer")
local log = require("core.log")

if not colorizer_present then
  return log.warn("Module 'colorizer' is not installed or could not be loaded")
end

local config = {}

colorizer.setup(config)
