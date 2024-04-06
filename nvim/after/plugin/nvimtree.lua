-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    update_cwd = false,
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = false,
            },
        },
        change_dir = {
            enable = false,
        },
    },
    git = {
        ignore = false
    },
})

vim.keymap.set('n', '<leader>f', ":NvimTreeFindFile<CR>")
vim.keymap.set('n', '<leader>t', ":NvimTreeToggle<CR>")
--vim.keymap.set('n', '<leader>t', ":NvimTreeFindFileToggle<CR>")
