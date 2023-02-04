local dap_presnet, dap = pcall(require, "dap")
local dapui_present, dapui = pcall(require, "dapui")
local log = require("core.log")

if not dap_presnet then
  return log.warn("Module 'dap' is not installed or could not be loaded")
end

if not dapui_present then
  return log.warn("Module 'dapui' is not installed or could not be loaded")
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = "/Users/joan/.local/share/nvim/mason/bin/codelldb",
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
