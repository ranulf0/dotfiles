vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>j", ":resize -2 <CR>")
vim.keymap.set("n", "<leader>k", ":resize +2 <CR>")
vim.keymap.set("n", "<leader>h", ":vertical resize -2 <CR>")
vim.keymap.set("n", "<leader>l", ":vertical resize +2 <CR>")

vim.keymap.set("n", "p", "pg`]")

local function enable_mouse_resize()
    vim.o.mouse = "n"
    vim.api.nvim_create_autocmd("CursorMoved", {
        once = true,
        callback = function()
            vim.o.mouse = ""
        end,
    })
end

vim.keymap.set("n", "<Leader>r", enable_mouse_resize, { silent = true, noremap = true })

vim.keymap.set("x", "<leader>\\", ":'<,'>EasyAlign */\\\\$/<CR>")
