local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.rnu = true
opt.mouse = 'a'
opt.expandtab = true
opt.termguicolors = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.splitbelow = true
opt.splitright = true

g.material_style = 'deep ocean'

cmd [[colorscheme material]]

