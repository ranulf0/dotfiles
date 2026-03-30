vim.g.mapleader = " "

local configs = {
    guicursor = "",
    nu = true,
    relativenumber = true,
    colorcolumn = "80",
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = true,
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
    undofile = true,
    hlsearch = true,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    mouse ='',
    cursorline = true,
    ignorecase = true,
    smartcase = true,
    list = true,
}

for key,val in pairs (configs) do
    vim.opt[key] = val
end
