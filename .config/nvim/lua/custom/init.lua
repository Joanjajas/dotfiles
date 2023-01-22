local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWrite", {
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.opt.guifont = "CaskaydiaCove Nerd Font:h14"
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_antialiasing = false
