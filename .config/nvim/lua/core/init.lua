-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  require("core.util").bootstrap_lazy(lazypath)
end

-- add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
