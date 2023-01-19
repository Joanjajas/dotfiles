local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.rustfmt,
  b.formatting.stylua,
}

null_ls.setup {
  sources = sources,
}
