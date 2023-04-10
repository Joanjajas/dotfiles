local lspsaga_present, lspsaga = pcall(require, "lspsaga")
local log = require("core.log")

if not lspsaga_present then
  return log.warn("Module 'lspsaga' is not installed or could not be loaded")
end

local config = {}

lspsaga.setup(config)
