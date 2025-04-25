return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local bubbles_theme = {
      normal = {
        a = { fg = '#1e1e2e', bg = '#89b4fa' },
        b = { fg = '#cdd6f4', bg = '#45475a' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
      insert = {
        a = { fg = '#1e1e2e', bg = '#a6e3a1' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
      visual = {
        a = { fg = '#1e1e2e', bg = '#cba6f7' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
      replace = {
        a = { fg = '#1e1e2e', bg = '#f38ba8' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
      command = {
        a = { fg = '#1e1e2e', bg = '#fab387' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
      inactive = {
        a = { fg = '#cdd6f4', bg = '#212121' },
        b = { fg = '#cdd6f4', bg = '#212121' },
        c = { fg = '#cdd6f4', bg = '#212121' },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { "NvimTree" },
        },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 }
        },
        lualine_b = {
          'branch'
        },
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 3
          }
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 }
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 3
          }
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
}
