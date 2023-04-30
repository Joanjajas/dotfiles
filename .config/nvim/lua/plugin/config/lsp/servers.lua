local lspconfig_present, lspconfig = pcall(require, "lspconfig")
local log = require("core.log")

if not lspconfig_present then
  return log.warn("Module 'lspconfig' is not installed or could not be loaded")
end

local handlers = require("plugin.config.lsp.util").handlers
local capabilities = require("plugin.config.lsp.util").capabilities

-- default setup for lua language server
lspconfig.lua_ls.setup({
  handlers = handlers,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- user installed servers
local servers = { "rust_analyzer", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    handlers = handlers,
    capabilities = capabilities,
  })
end
