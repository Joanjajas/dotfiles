local notify_present, notify = pcall(require, "notify")
local log = require("core.log")

if not notify_present then
  return log.warn("Module 'notify' is not installed or could not be loaded")
end

-- set notify as the default nvim notification provider
vim.notify = notify

local config = {
  timeout = 4000,
  top_down = false,
  background_colour = "#000000",
}

notify.setup(config)
