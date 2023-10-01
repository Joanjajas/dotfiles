local luasnip = require("luasnip")

-- for friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

local config = {}

luasnip.setup(config)
