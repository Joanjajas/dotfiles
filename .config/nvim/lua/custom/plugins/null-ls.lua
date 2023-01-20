local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.rustfmt,
  b.formatting.stylua,
  b.formatting.shfmt,
}

null_ls.setup {
  sources = sources,
}
