local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["i"] = actions.file_split,
        ["s"] = actions.file_vsplit,
        ["t"] = actions.file_tab,
        ["o"] = actions.select_default,
      }
    }
  },
}
