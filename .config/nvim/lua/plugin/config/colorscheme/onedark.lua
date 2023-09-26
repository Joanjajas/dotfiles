local onedark_present, onedark = pcall(require, "onedark")
local log = require("core.log")

if not onedark_present then
  return log.warn("Module 'onedark' is not installed or could not be loaded")
end

local config = {
  style = "deep",
  transparent = "true",
}

onedark.setup(config)
