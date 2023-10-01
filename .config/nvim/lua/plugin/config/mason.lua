local mason = require("mason")

local mason_config = {
  PATH = "skip",
}

local ensure_installed = {
  -- lsp servers
  "lua-language-server",
  "rust-analyzer",
  "pyright",

  -- formatters
  "stylua",
  "autopep8",
}

-- custom nvchad cmd to install all mason binaries listed
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
end, {})

mason.setup(mason_config)
