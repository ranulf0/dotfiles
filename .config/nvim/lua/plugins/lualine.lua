return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require('lualine').setup {
      --options = { theme  = 'base16' },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 3 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      }
    }
  end,
}
