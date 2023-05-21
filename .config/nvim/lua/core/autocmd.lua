-- open nvimtree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.toggle({ focus = false })
  end,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("core.util").format_on_save()
  end,
})

-- remove auto comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
