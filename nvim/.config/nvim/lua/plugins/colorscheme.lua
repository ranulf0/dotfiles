return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },

      integrations = {
        nvimtree = true,
        treesitter = true,
        gitsigns = true,
      },

      custom_highlights = function(colors)
        return {
          CursorLine = {
            bg = "#2a2a2e",
          },

          ColorColumn = {
            bg = "#2a2a2e",
          },

          NormalFloat = {
            bg = "NONE",
          },

          FloatBorder = {
            fg = colors.surface2,
            bg = "NONE",
          },

          FzfLuaNormal = {
            bg = "NONE",
          },

          FzfLuaBorder = {
            fg = colors.surface2,
            bg = "NONE",
          },

          FzfLuaPreviewNormal = {
            bg = "NONE",
          },

          FzfLuaPreviewBorder = {
            fg = colors.surface2,
            bg = "NONE",
          },

          FzfLuaCursorLine = {
            bg = "#2a2a2e",
          },

          FzfLuaCursorLineNr = {
            fg = colors.blue,
            bg = "#2a2a2e",
          },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
