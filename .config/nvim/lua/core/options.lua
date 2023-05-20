-- neovim API aliases
local g = vim.g
local opt = vim.opt

-- global variables
g.mapleader = " "
g.copilot_assume_mapped = true
g.copilot_no_tab_map = true

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
opt.fillchars = { vert = " ", horiz = " ", fold = " ", eob = " ", diff = " " }

-- go to next/previous line when cursor reaches end/beginning of line
opt.whichwrap:append("hl")
