local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt


opt.rnu = true
opt.mouse = 'a'
opt.expandtab = true
opt.termguicolors = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.splitbelow = true
opt.splitright = true

cmd [[colorscheme gotham]]
