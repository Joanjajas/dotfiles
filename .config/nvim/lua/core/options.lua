-- neovim API aliases
local g = vim.g
local opt = vim.opt

-- global variables
g.mapleader = " "

-- global options
opt.showmode = false
opt.termguicolors = true
opt.cursorline = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.splitright = true
opt.splitbelow = true
opt.rnu = true
opt.mouse = "a"
opt.scrolloff = 15

-- go to next/previous line when cursor reaches end/beginning of line
opt.whichwrap:append("hl")
