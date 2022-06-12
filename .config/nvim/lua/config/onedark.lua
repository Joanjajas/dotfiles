require('onedark').setup  {
    style = 'deep',
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    colors = { bg0 = "#090B10", bg1 = "#0F111A", bg_d = "#0F111A"},

    diagnostics = {
        darker = false,
    },
}

vim.cmd 'colorscheme onedark'
