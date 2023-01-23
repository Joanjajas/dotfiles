local M = {}

M.general = {
  n = {
    ["<leader>s"] = { ":update<CR>", "save file" },
    ["<BS>"] = { ":q!<CR>", "close file without saving" },
    ["{{"] = { "A {}<Left><CR><Rsc>O", "function brackets" },
    [";;"] = { "A;<Esc>", "add semicolon" },
    ["<D-v>"] = { '"+p', "paste" },
    ["<leader>fs"] = { ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", "toggle fulscreen" },
  },

  i = {
    ["kj"] = { "<Esc>", "normal mode" },
    ["{{"] = { "<Esc>A {}<Left><CR><esc>O", "fucntion brackets" },
    [";;"] = { "<Esc>A;", "add semicolon" },
    ["<D-v>"] = { "<C-r>*", "paste" },
  },

  t = {
    ["kj"] = { "<C-\\><C-n>", "normal mode" },
    ["<D-v>"] = { '<C-\\><C-n>"+pi', "paste" },
  },

  c = {
    ["<D-v>"] = { "<C-r>+", "paste" },
  },
}

M.todo = {
  n = {
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", "find todos" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["gn"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["gN"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto_next",
    },
  },
}

return M
