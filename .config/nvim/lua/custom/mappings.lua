local M = {}

M.general = {
  n = {
    ["<leader>s"] = { ":w<CR>", "save file" },
    ["<BS>"] = { ":q!<CR>", "close file without saving" },
    ["{{"] = { "A {}<Left><CR><Rsc>O" },
    [";;"] = { "A;<Esc>" },
    ["<D-v>"] = { '"+p' },
  },

  i = {
    ["kj"] = { "<Esc>" },
    ["{{"] = { "<Esc>A {}<Left><CR><esc>O" },
    [";;"] = { "<Esc>A;" },
    ["<D-v>"] = { "<C-r>*" },
  },

  t = {
    ["kj"] = { "<C-\\><C-n>" },
    ["<D-v>"] = { '<C-\\><C-n>"+pi' },
  },

  c = {
    ["<D-v>"] = { "<C-r>+" },
  },
}

M.lspconfig = {
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
