local null_ls_present, null_ls = pcall(require, "null-ls")
local log = require("core.log")

if not null_ls_present then
  return log.warn("Module 'null-ls' is not installed or could not be loaded")
end

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
