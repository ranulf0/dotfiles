return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    -- Keybindings
    vim.keymap.set("n", "<leader>F", builtin.find_files, {})
    vim.keymap.set("n", "<leader>G", builtin.live_grep, {})

    -- Setup
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "tags",
          "ut_assert",
          "unit_test",
          "unit-test",
          "ut-stubs",
        },
      },
    })
  end,
}
