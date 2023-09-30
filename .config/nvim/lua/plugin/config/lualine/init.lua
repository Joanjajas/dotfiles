local lualine = require("lualine")

local component = require("plugin.config.lualine.component")
local theme = require("lualine.themes.auto")
theme.normal.c.bg = "none"
theme.inactive.c.bg = "none"
theme.insert.c.bg = "none"
theme.visual.c.bg = "none"
theme.replace.c.bg = "none"
theme.command.c.bg = "none"

local config = {
  options = {
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = theme,

    refresh = {
      statusline = 150,
    },
  },

  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      component.mode,
      component.branch,
      "filename",
      "diff",
    },

    lualine_x = {
      component.lsp_clients,
      component.formatter,
      component.diagnostics,
      "%=",
      component.copilot,
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
