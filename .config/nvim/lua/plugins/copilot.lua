return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = false },
    },
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
        title_pos = "center",
      },
      headers = {
        user = '<',
        assistant = '>',
      },
      auto_close = true,
      auto_insert = true,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", mode = { "n", "v" }},
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }},
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }},
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = { "n", "v" }},
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }},
    },
  },
}
