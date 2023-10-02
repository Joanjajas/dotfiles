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
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.smarttab = true
opt.mouse = "a"

-- remove window borders
opt.fillchars = { vert = " ", horiz = " ", fold = " ", eob = " ", diff = " " }

-- go to next/previous line when cursor reaches end/beginning of line
opt.whichwrap:append("hl")
