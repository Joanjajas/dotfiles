local neotree_present, neotree = pcall(require, "neo-tree")
local log = require("core.log")

if not neotree_present then
  return log.warn("Module 'neo-tree' is not installed or could not be loaded")
end

local config = {
  hide_root_node = true,
  popup_border_style = "rounded",

  sources = {
    "filesystem",
    "git_status",
  },

  source_selector = {
    winbar = true,
    content_layout = "center",
  },

  default_component_configs = {
    indent = {
      with_markers = false,
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    },

    icon = {
      folder_empy = "",
      folder_empty_open = "",
    },

    modified = {
      symbol = "",
    },

    name = {
      use_git_status_colors = false,
    },

    git_status = {
      symbols = {
        ignored = "",
        unstaged = "",
        staged = "",
      },

      align = "right",
    },
  },

  window = {
    position = "right", -- left, right, top, bottom, float, current
    width = 35, -- applies to left and right positions
    auto_expand_width = true, -- expand the window when file exceeds the window width. does not work with position = "float"

    mappings = {
      ["S"] = "open_split",
      ["<C-s>"] = "open_vsplit",
    },
  },

  filesystem = {
    window = {
      mappings = {
        ["<bs>"] = function()
          vim.cmd(":q!")
        end,
      },
    },

    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
      show_hidden_count = false, -- when true, the number of hidden items in each folder will be shown as the last entry
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false, -- only works on Windows for hidden files/directories
      hide_by_name = {
        ".DS_Store",
        "thumbs.db",
        --"node_modules",
      },
    },

    group_empty_dirs = true, -- when true, empty folders will be grouped together
    follow_current_file = true, -- This will find and focus the file in the active buffer every time
  },

  buffers = {
    bind_to_cwd = true,
    follow_current_file = true, -- This will find and focus the file in the active buffer every time
    -- the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty directories will be grouped together
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["bd"] = "buffer_delete",
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
  },
  example = {
    renderers = {
      custom = {
        { "indent" },
        { "icon", default = "C" },
        { "custom" },
        { "name" },
      },
    },
    window = {
      mappings = {
        ["<cr>"] = "toggle_node",
        ["<C-e>"] = "example_command",
        ["d"] = "show_debug_info",
      },
    },
  },
}

neotree.setup(config)
