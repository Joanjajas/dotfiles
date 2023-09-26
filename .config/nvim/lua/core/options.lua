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
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.smarttab = true
opt.mouse = "a"
opt.fillchars = { vert = " ", horiz = " ", fold = " ", eob = " ", diff = " " }

-- go to next/previous line when cursor reaches end/beginning of line
opt.whichwrap:append("hl")

vim.opt.guifont = "CaskaydiaCove Nerd Font:h14"
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_antialiasing = false
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_size = 0.05
