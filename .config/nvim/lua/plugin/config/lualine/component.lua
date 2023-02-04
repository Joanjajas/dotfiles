local M = {}

M.mode = {
  function()
    local mode_name = require("plugin.config.lualine.mode").name
    local mode = vim.api.nvim_get_mode().mode

    if mode_name[mode] == nil then
      return mode
    end

    return mode_name[mode]
  end,

  color = function()
    local mode_color = require("plugin.config.lualine.mode").color
    local mode = vim.api.nvim_get_mode().mode

    return { fg = mode_color[mode] }
  end,
}

M.lsp_progress = {
  function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local Lsp = vim.lsp.util.get_progress_messages()[1]

    if vim.o.columns < 120 or not Lsp then
      return ""
    end

    local msg = Lsp.message or ""
    local percentage = Lsp.percentage or 0
    local title = Lsp.title or ""
    local spinners = { "⣷", "⣯", "⣟", "⡿", "⢿", "⣻", "⣽", "⣾" }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

    return content or ""
  end,

  color = { fg = "#008080" },
}

M.lsp_clients = {
  function()
    local clients = vim.lsp.get_active_clients({
      bufnr = vim.api.nvim_get_current_buf(),
    })

    for _, client in ipairs(clients) do
      if client.name ~= "null-ls" then
        return string.format("[LS]: %s", client.name)
      end
    end

    return "[LS]: Inactive"
  end,

  color = { fg = "#008080" },
}

M.formatter = {
  function()
    local formatter = require("core.util").get_formatter()
    local clients = vim.lsp.get_active_clients({
      bufnr = vim.api.nvim_get_current_buf(),
    })

    if formatter == nil then
      return "[Formatter]: None"
    end

    -- if we are using the language server client formatter display this
    for _, client in ipairs(clients) do
      if client.name == formatter.name then
        return string.format("[Formatter]: LSP")
      end
    end

    return string.format("[Formatter]: %s", formatter.name)
  end,

  color = { fg = "#008080" },
}

return M
