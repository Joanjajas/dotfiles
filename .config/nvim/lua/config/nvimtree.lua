local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require('nvim-tree').setup {
  open_on_setup = true,
  open_on_tab = true,
  update_cwd = true,

  view = {
    side = "right",
    width = 40,

    mappings = {
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

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  git = {
    enable = false,
  },
}
