local comment_present, comment = pcall(require, "comment")
local log = require("core.log")

if not comment_present then
  return log.warn("Module 'comment' is not installed or could not be loaded")
end

local config = {
  mappings = {
    basic = false,
    extra = false,
  },
}

comment.setup(config)
