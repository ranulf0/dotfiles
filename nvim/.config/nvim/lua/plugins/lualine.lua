return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup {
      options = {
        disabled_filetypes = {
          statusline = { "NvimTree", "alpha", },
        },
        globalstatus = false,
        section_separators = {
          left = "",
          right = "",
        },
        component_separators = "",
      },
    }
  end,
}
