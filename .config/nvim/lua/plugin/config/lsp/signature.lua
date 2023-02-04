local signature_present, signature = pcall(require, "lsp_signature")
local log = require("core.log")

if not signature_present then
  return log.warn("Module 'lsp_signature' is not installed or could not be loaded")
end

local config = {
  hint_enable = false,
  doc_lines = 0,
}

signature.setup(config)
