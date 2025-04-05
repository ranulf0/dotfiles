local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local user_group = augroup("rnlf", {})

local lang_opt = {
  lua = { small_indent = true, },
  ruby = { small_indent = true, },
}

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

autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

for lang,data in pairs (lang_opt) do
  if data.small_indent ~= nil then
    autocmd("FileType", {
      pattern = lang,
      callback = function()
        vim.opt_local.listchars:append({ leadmultispace = USER.indent_marker(2) })
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
      end
    })
  end
end
