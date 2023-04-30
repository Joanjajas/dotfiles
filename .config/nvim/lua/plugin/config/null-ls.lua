local null_ls_present, null_ls = pcall(require, "null-ls")
local log = require("core.log")

if not null_ls_present then
  return log.warn("Module 'null-ls' is not installed or could not be loaded")
end

-- null-ls builtin linters and formatters
local builtin = null_ls.builtins

local config = {
  sources = {
    builtin.formatting.stylua,
    builtin.formatting.autopep8,
  },
}

null_ls.setup(config)
