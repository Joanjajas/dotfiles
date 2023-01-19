local overrides = require "custom.plugins.overrides"

return {
  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["NvChad/ui"] = {
    override_options = overrides.buffline,
  },

  ["goolord/alpha-nvim"] = false
}

