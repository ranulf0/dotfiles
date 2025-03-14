local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_group = augroup("rnlf", {})

autocmd("BufwritePre", {
  group = user_group,
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

autocmd("BufWritePre", {
  group = user_group,
  pattern = "*",
  command = "%s#\\($\\n\\s*\\)\\+\\%$##e"
})

vim.api.nvim_create_autocmd("VimResized", {
    pattern = "*",
    command = "wincmd =",
})
