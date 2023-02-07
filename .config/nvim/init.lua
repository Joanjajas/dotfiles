require("core")
require("core.options")
require("core.keymaps")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  require("core.util").bootstrap_lazy(lazypath)
end

-- add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

require("plugin")
