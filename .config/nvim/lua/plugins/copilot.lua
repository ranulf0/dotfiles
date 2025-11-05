return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_enabled = 1
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      window = {
        layout = "float",
        border = "rounded",
      },
      auto_close = true,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>"},
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }},
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }},
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }},
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }},
    },
  },
}
