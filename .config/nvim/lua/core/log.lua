local log = {}

local levels = {
  { name = "trace", level = vim.log.levels.TRACE },
  { name = "debug", level = vim.log.levels.DEBGUG },
  { name = "info", level = vim.log.levels.INFO },
  { name = "warn", level = vim.log.levels.WARN },
  { name = "error", level = vim.log.levels.ERROR },
}

for _, v in ipairs(levels) do
  log[v.name] = function(...)
    if type(vim.notify) == "table" then
      -- for notify.nvim
      vim.notify(..., v.level, { title = "Config" })
    else
      local console_string = string.format("[Config]: %s", ...)
      vim.notify(console_string, v.level)
    end
  end
end

return log
