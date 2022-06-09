local g = vim.g
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,

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
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",

            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },

            glyphs = {
                default = "",
                symlink = "",

                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },

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
