local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWrite", {
    callback = function()
        vim.lsp.buf.format()
    end
})
