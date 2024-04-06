-- Lua initialization file
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1a1a", fg = "#ffffff" })
  end,
  group = custom_highlight,
})
vim.cmd [[colorscheme moonfly]]
