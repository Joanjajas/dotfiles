-- neovim API aliases
local g = vim.g
local opt = vim.opt

-- global variables
g.mapleader = " "

-- global options
opt.rnu = true
opt.showmode = false
opt.termguicolors = true
opt.scrolloff = 5
opt.expandtab = true
opt.splitright = true
opt.splitbelow = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.mouse = "a"

-- go to next/previous line when cursor reaches end/beginning of line
opt.whichwrap:append("hl")
