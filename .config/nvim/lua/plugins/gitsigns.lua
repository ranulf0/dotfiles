return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      preview_config = {
        border = "rounded",
      }
    })
    vim.keymap.set("n", "<leader>gs", ":Gitsigns preview_hunk <CR>")
    vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk <CR>")
    vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk <CR>")
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk <CR>")
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame <CR>")
  end
}
