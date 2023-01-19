local M = {}

M.general = {
  n = {
    ["<leader>s"] = { ":w<CR>", "save file" },
    ["<BS>"] = { ":q!<CR>", "close file without saving" },
    ["{{"] = { ":<Esc>A {}<Left><CR><esc>O" },
    [";;"] = { "A;<Esc>" },
  },

  i = {
    ["kj"] = { "<Esc>" },
    ["{{"] = { "<Esc>A {}<Left><CR><esc>O" },
    [";;"] = { "<Esc>A;" },
  },

  t = {
    ["kj"] = { "<C-\\><C-n>" },
  },
}

return M
