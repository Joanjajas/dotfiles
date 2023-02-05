local lualine_present, lualine = pcall(require, "lualine")
local log = require("core.log")

if not lualine_present then
  return log.warn("Module lualine is not installed or could not be loaded")
end

local component = require("plugin.config.lualine.component")

local config = {
  options = {
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },

    refresh = {
      statusline = 150,
    },
  },

  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      component.mode,
      "filename",
      component.branch,
      "diff",
    },

    lualine_x = {
      component.lsp_clients,
      component.formatter,
      component.diagnostics,
      "%=",
      "location",
      "filetype",
      component.encoding,
      component.fileformat,
    },

    lualine_y = {},
    lualine_z = {},
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

lualine.setup(config)
