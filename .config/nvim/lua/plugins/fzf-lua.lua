return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      file_ignore_patterns = {
        "tags",
        "ut_assert",
        "unit_test",
        "unit-test",
        "ut-stubs",
      },

      buffers = {
        sort_lastused = true,
        show_all_buffers = false,
      },

    })

    vim.keymap.set("n", "<leader>F", fzf.files,       {})
    vim.keymap.set("n", "<leader>G", fzf.live_grep,   {})
    vim.keymap.set("v", "<leader>G", fzf.grep_visual, {})
    vim.keymap.set("n", "<leader>R", fzf.oldfiles,    {})
    vim.keymap.set("n", "<leader>B", fzf.buffers,     {})
    vim.keymap.set("n", "<leader>Q", fzf.quickfix,    {})
  end,
}
