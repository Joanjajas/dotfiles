vim.cmd 'packadd paq-nvim'

require ('paq') {
    'savq/paq-nvim'; 

    -- Core plugins
    'kyazdani42/nvim-tree.lua';       -- File browser
    'windwp/nvim-autopairs';          -- Auto pairs
    'kyazdani42/nvim-web-devicons';   -- Icons
    'nvim-lualine/lualine.nvim';      -- Status line
    'lewis6991/gitsigns.nvim';        -- Git integration
    'nvim-lua/plenary.nvim';


    -- LSP Plugins
    'neovim/nvim-lspconfig';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-vsnip';
    'hrsh7th/vim-vsnip';


    -- Colorschemes
    'whatyouhide/vim-gotham';
    'marko-cerovac/material.nvim';
    'bluz71/vim-nightfly-guicolors';
    'Shatur/neovim-ayu';
}
