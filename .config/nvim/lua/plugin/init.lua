local plugins = require("plugin.plugins")
local lazy_config = require("plugin.config.lazy")

-- setup lazy.nvim
require("lazy").setup(plugins, lazy_config)

-- set the custom colorscheme once all start plugins are loaded
local colorscheme = pcall(vim.cmd.colorscheme, "tokyonight")

-- set a default nvim theme in case that the custom theme can't be loaded
if not colorscheme then
  vim.cmd.colorscheme("habamax")
  require("core.log").error("Unable to load custom colorscheme")
end
