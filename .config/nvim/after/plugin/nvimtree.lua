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
        --width = 50,
        float = {
            enable = true,
            open_win_config = function()
                local HEIGHT_RATIO = 0.5
                local WIDTH_RATIO = 0.5
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        }
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
