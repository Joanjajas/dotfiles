local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

g.nvim_tree_show_icons = {
    folders = 1,
    files = 1,
    git = git_status,
}


g.nvim_tree_icons = {
    default = "",
    symlink = "",

    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
    },

    folder = {
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
    },
}


require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,

    git = {
        ignore = false,
    },

    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        }
    },

    renderer = {
        indent_markers = {
            enable = true,
        }
    },

    view = {
        side = "left",
        width = 30,

        mappings = {
            custom_only = false,
            list = {
                { key = {"q"}, cb = ":q!<CR>", mode = "n"},
                { key = {"<BS>"}, cb = ":q!<CR>", mode = "n"},
                { key = {"x"}, cb = tree_cb('close_node') },
                { key = {"s"}, cb = tree_cb('vsplit') },
                { key = {"i"}, cb = tree_cb('split') },
                { key = {"t"}, cb = tree_cb('tabnew') },
            }
        }
    },
}
