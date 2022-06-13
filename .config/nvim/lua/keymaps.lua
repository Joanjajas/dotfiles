local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd
local g = vim.g

-- Set space as the leader key
g.mapleader = ' '

-- Insert mode maps
map('i', 'kj', '<Esc>', default_opts)
map('i', ';;', '<C-o>A;', default_opts)
map('i', '{{', '<C-o>A {}<Left><CR><esc>O', default_opts)
map('i', '<M-l>', '<Right>', default_opts)
map('i', '<M-k>', '<Up>', default_opts)
map('i', '<M-j>', '<Down>', default_opts)
map('i', '<M-h>', '<Left>', default_opts)

-- Normal mode maps
map('n', '<C-l>', ':wincmd l<CR>', default_opts)
map('n', '<C-k>', ':wincmd k<CR>', default_opts)
map('n', '<C-j>', ':wincmd j<CR>', default_opts)
map('n', '<C-h>', ':wincmd h<CR>', default_opts)

map('n', '<F7>', ':20sp | term<CR>', default_opts)
map('n', '<F8>', ':tabe | term<CR>', default_opts)

map('n', '<BS>', ':q!<CR>', default_opts)
map('n', '<Leader>', ':w<CR>', default_opts)
map('n', ';;', 'A;<esc>', default_opts)
map('n', '<Leader>f', ':Telescope find_files<CR>', default_opts)
map('n', '<Leader>g', ':Telescope git_commits<CR>', default_opts)

map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)

map('n', '<Leader>r', '*:%s/<C-R>///gc | noh <left><left><left>' ..
                                            '<left><left><left>' ..
                                            '<left><left><left><left>', default_opts)

map('n', '<Leader>R', ':%s/\\<\\>//gc | noh <left><left><left>' ..
                                           '<left><left><left>' ..
                                           '<left><left><left>' ..
                                           '<left><left><left><left>', default_opts)

-- Terminal mode maps
map('t', 'kj', '<C-\\><C-n>', default_opts)
