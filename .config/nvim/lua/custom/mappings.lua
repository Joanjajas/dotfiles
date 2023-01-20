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
