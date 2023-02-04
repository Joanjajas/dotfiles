local mason_present, mason = pcall(require, "mason")
local log = require("core.log")

if not mason_present then
  return log.warn("Module 'mason' is not installed or could not be loaded")
end

local config = {
  PATH = "skip",
}

mason.setup(config)
