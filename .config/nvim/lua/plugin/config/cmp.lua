local cmp_present, cmp = pcall(require, "cmp")
local luasnip_present, luasnip = pcall(require, "luasnip")
local autopairs_present, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local log = require("core.log")

if not cmp_present then
  return log.warn("Module 'cmp' is not installed or could not be loaded")
end

if not luasnip_present then
  return log.warn("Module 'luasnip' is not installed or could not be loaded")
end

if not autopairs_present then
  return log.warn("Module 'nvim-autopairs' is not installed or could not be loaded")
end

local config = {
  preselect = false,

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },

    format = require("lspkind").cmp_format({
      mode = "symbol_text",

      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        cmdline = "[Cmd]",
      },
    }),
  },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),

    ["<Tab>"] = cmp.mapping(function(fallback)
      local copilot_keys = vim.fn["copilot#Accept"]()
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif copilot_keys ~= "" and type(copilot_keys) == "string" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        get_bufnrs = require("core.util").get_visible_buffers,
      },
    },
  },
}

cmp.setup.cmdline({ ":", "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "cmdline" },
  }),
})

cmp.setup(config)
cmp.event:on("confirm_done", autopairs.on_confirm_done())
