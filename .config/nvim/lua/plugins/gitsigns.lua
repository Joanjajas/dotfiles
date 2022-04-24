require('gitsigns').setup({
    keymaps = {
        noremap = true,

        ['n <leader>n'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
        ['n <leader>h'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    },
})
