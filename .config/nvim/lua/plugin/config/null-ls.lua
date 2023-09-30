local null_ls = require("null-ls")

-- null-ls builtin linters and formatters
local builtin = null_ls.builtins

local null_ls_config = {
  sources = {
    builtin.formatting.stylua,
    builtin.formatting.autopep8,
    builtin.formatting.prettier,
  },
}

null_ls.setup(null_ls_config)
