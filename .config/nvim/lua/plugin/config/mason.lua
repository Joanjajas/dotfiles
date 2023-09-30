local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local mason = require("mason")

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
mason_null_ls.setup(mason_null_ls_config)
mason_lspconfig.setup(mason_lsp_config)
