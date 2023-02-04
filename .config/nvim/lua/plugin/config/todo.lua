local todo_present, todo = pcall(require, "todo-comments")
local log = require("core.log")

if not todo_present then
  return log.warn("Module 'todo-comments' is not installed or could not be loaded")
end

local config = {}

todo.setup(config)
