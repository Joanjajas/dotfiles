local notify_present, notify = pcall(require, "notify")
local log = require("core.log")

if not notify_present then
  return log.warn("Module 'notify' is not installed or could not be loaded")
end

vim.notify = notify

local config = {
  timeout = 4000,
  top_down = false,
}

notify.setup(config)
