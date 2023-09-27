local mason_lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_null_ls_present, mason_null_ls = pcall(require, "mason-null-ls")
local mason_present, mason = pcall(require, "mason")
local log = require("core.log")

if not mason_present then
  return log.warn("Module 'mason' is not installed or could not be loaded")
end

if not mason_lspconfig_present then
  return log.warn("Module 'mason-lspconfig' is not installed or could not be loaded")
end

if not mason_null_ls_present then
  return log.warn("Module 'mason-null-ls' is not installed or could not be loaded")
end

local mason_config = {
  PATH = "skip",
}

local mason_lsp_config = {
  ensure_installed = {
    "pyright",
    "lua_ls",
    "rust_analyzer",
  },

  automatic_installation = true,
}

local mason_null_ls_config = {
  ensure_isntalled = {
    "autopep8",
    "stylua",
  },

  automatic_installation = true,
}

mason.setup(mason_config)
mason_lspconfig.setup(mason_lsp_config)
mason_null_ls.setup(mason_null_ls_config)
