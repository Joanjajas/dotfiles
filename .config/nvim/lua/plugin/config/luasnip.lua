local luasnip_present, luasnip = pcall(require, "luasnip")
local log = require("core.log")

if not luasnip_present then
  return log.warn("Module 'luasnip' is not installed or could not be loaded")
end

require("luasnip").filetype_extend("typescriptreact", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()

local config = {}

luasnip.setup(config)
