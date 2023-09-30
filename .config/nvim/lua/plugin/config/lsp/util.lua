local cmp_capabilities = require("cmp_nvim_lsp")

local M = {}

-- change diagnostic icons in the sign column
M.set_icons = function()
  local icons = { Error = "", Warn = "", Hint = "", Info = "" }

  for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
  end
end

-- make lsp floating window corners rounded
M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- cmp default capabilities
M.capabilities = cmp_capabilities.default_capabilities()

return M
