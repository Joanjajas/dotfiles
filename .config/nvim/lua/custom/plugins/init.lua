local overrides = require "custom.plugins.overrides"

return {
  ["neovim/nvim-lspconfig"] = {
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["folke/todo-comments.nvim"] = {
    event = "VimEnter",
    config = function()
      require("todo-comments").setup()
    end,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    event = "VimEnter",
    override_options = overrides.nvimtree,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },

  ["folke/which-key.nvim"] = {
    enabled = true,
  },
}
