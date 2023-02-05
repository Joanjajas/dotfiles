-- TODO: remake keymaps

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- save current buffer
map("n", "<leader>s", ":update<CR>", default_opts)

-- exit insert mode
map("i", "kj", "<Esc>", default_opts)
map("t", "kj", "<C-\\><C-n>", default_opts)

-- close current window
map("n", "<BS>", ":q!<CR>", default_opts)

-- don't copy the replaced text after pasting in visual mode
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', default_opts)

-- insert function brackets
map("n", "{{", "A {}<Left><CR><Esc>O<Esc>", default_opts)
map("i", "{{", "<Esc>A {}<Left><CR><Esc>O", default_opts)

-- insert endline semicolon
map("n", ";;", "A;<Esc>", default_opts)
map("i", ";;", "<Esc>A;", default_opts)

-- insert endline comma
map("n", ",,", "A,<Esc>", default_opts)
map("i", ",,", "<Esc>A,", default_opts)

-- toggle neotree
map("n", "<C-n>", ":NvimTreeToggle<CR>, default_opts")

-- stop search highlighting
map("n", "<Esc>", ":noh<CR>", default_opts)

-- allow moving the cursor through wrapped lines
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("v", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("v", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- paste from clipboard
map("i", "<D-v>", "<C-r><C-o>+", default_opts)
map("n", "<D-v>", '"+p', default_opts)
map("t", "<D-v>", '<C-\\><C-n>"+pi', default_opts)
map("c", "<D-v>", "<C-r>+", default_opts)

-- navigate within insert mode
map("i", "<C-h>", "<Left>", default_opts)
map("i", "<C-j>", "<Down>", default_opts)
map("i", "<C-k>", "<Up>", default_opts)
map("i", "<C-l>", "<Right>", default_opts)

-- move around splits using Ctrl + { h,j,k,l }
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- telescope
map("n", "<leader>fa", ":Telescope find_files no_ignore=true hidden=true<CR>", default_opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", default_opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", default_opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", default_opts)
map("n", "<leader>th", ":Telescope colorscheme<CR>", default_opts)
map("n", "<leader>gs", ":Telescope git_status<CR>", default_opts)
map("n", "<leader>gc", ":Telescope git_commits<CR>", default_opts)

-- lsp
map("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", default_opts) -- open definition in a new split
map("n", "gD", ":vsplit | lua vim.lsp.buf.declaration()<CR>", default_opts) -- open declaration in a new split

map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, default_opts)

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, default_opts)

map("n", "K", function()
  vim.lsp.buf.hover()
end, default_opts)

map("n", "gr", function()
  vim.lsp.buf.references()
end, default_opts)

map("n", "m", function()
  vim.diagnostic.open_float()
end, default_opts)

map("n", "gn", function()
  vim.diagnostic.goto_next()
end, default_opts)

map("n", "gN", function()
  vim.diagnostic.goto_prev()
end, default_opts)

-- gitsigns
map("n", "<leader>nh", ":Gitsigns next_hunk<CR>", default_opts)
map("n", "<leader>Nh", ":Gitsigns prev_hunk<CR>", default_opts)
map("n", "<leader>ph", ":Gitsigns preview_hunk<CR>", default_opts)
map("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", default_opts)
map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", default_opts)

-- todo comments
map("n", "<leader>tc", ":TodoTelescope<CR>", default_opts)

-- debug
map("n", "<leader>tb", ":lua require('dap').toggle_breakpoint()<CR>", default_opts)
map("n", "<leader>ui", ":lua require('dap').continue()<CR>", default_opts)

-- comments
map("n", "<leader>/", ":lua require('comment.api').toggle.linewise.current()<CR>", default_opts)
map("v", "<leader>/", ":lua require('comment.api').toggle.linewise(vim.fn.visualmode())<CR>", default_opts)
