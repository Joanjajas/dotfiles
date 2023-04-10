-- global editor diagnostics config
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})

-- diagnostics icons
require("plugin.config.lsp.util").set_icons()

-- signature help, docs and completion for the nvim lua API.
require("plugin.config.lsp.neodev")

-- improve neovim lsp experience
require("plugin.config.lsp.lspsaga")

-- function signatures
require("plugin.config.lsp.signature")

-- lsp servers
require("plugin.config.lsp.servers")
