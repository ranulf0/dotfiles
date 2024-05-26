local default_opts = { noremap = true, silent = true }

require('neogen').setup {}

vim.keymap.set("n", "<leader>d", function()
    require("neogen").generate()
end, default_opts)

vim.keymap.set("i", "<C-j>", function()
    require('neogen').jump_next()
end, default_opts)
vim.keymap.set("i", "<C-k>", function()
    require('neogen').jump_prev()
end, default_opts)
