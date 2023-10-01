local M = {}

-- bootstrap lazy.nvim
M.bootstrap_lazy = function(lazypath)
  print("Installing package manager  ...")

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  print(" ")
end

-- get visible buffers
M.get_visible_buffers = function()
  local buffers = {}
  local windows = vim.api.nvim_list_wins()

  for _, window in ipairs(windows) do
    buffers[vim.api.nvim_win_get_buf(window)] = true
  end

  return vim.tbl_keys(buffers)
end

-- returns the current buffer formatter if there is any configured and active
M.get_buffer_formatter = function()
  local filetype = vim.bo.filetype
  local null_ls_sources = require("null-ls").get_sources()

  -- check if there is any null-ls formatter available
  for _, source in ipairs(null_ls_sources) do
    if source.filetypes[filetype] then
      return source
    end
  end

  -- if there is no null-ls formatter check if any of the lsp clients supports formatting
  local lsp_clients = vim.lsp.get_active_clients({
    bufnr = vim.api.nvim_get_current_buf(),
  })

  for _, client in ipairs(lsp_clients) do
    if client.supports_method("textDocument/formatting") then
      return client
    end
  end
end

-- format on save
-- if there is a null-ls formatter configured, it will be always used, so be sure
-- to have the formatter installed. In the case that there is no null-ls formatter
-- setted up, the lsp client formatter will be used if the client supports formatting
M.format_on_save = function()
  local formatter = M.get_buffer_formatter()

  if formatter == nil then
    return
  end

  vim.lsp.buf.format({
    filter = function(client)
      -- if the formatter name and client name are not the same it means that
      -- the current formatter is not the lsp client formatter and is a null-ls
      -- formatter, so use it
      if client.name ~= formatter.name then
        return client.name == "null-ls"
      end

      -- if we reach here it means that the formatter is the lsp client formatter
      -- and there is no null-ls formatter, so use the lsp client one
      return true
    end,
  })
end

return M
