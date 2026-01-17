return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                                     ",
      "       ████ ██████           █████      ██                     ",
      "      ███████████             █████                             ",
      "      █████████ ███████████████████ ███   ███████████   ",
      "     █████████  ███    █████████████ █████ ██████████████   ",
      "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
      "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
      " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File",    ":FzfLua files<CR>"),
      dashboard.button("n", "  New File",     ":ene | startinsert<CR>"),
      dashboard.button("g", "  Find Text",    ":FzfLua live_grep<CR>"),
      dashboard.button("r", "  Recent Files", ":FzfLua oldfiles<CR>"),
      dashboard.button("c", "  Config",       ":FzfLua files cwd=~/.config/nvim<CR>"),
      dashboard.button("L", "󰒲  Lazy",         ":Lazy<CR>"),
      dashboard.button("q", "󰗼  Quit",         ":qa<CR>"),
    }

    dashboard.section.footer.val = function()
      local stats = require("lazy").stats()
      return {
        string.format(
          "⚡ Neovim loaded %d/%d plugins in %.2fms",
          stats.loaded,
          stats.count,
          stats.startuptime
        )
      }
    end

    local function vertical_padding()
      local lines = vim.o.lines
      local header_height = #dashboard.section.header.val
      local buttons_height = #dashboard.section.buttons.val + 2
      local footer_height = 1

      local content_height = header_height + buttons_height + footer_height
      return math.max(2, math.floor((lines - content_height) / 2))
    end

    dashboard.config.layout = {
      { type = "padding", val = vertical_padding },
      dashboard.section.header,
      { type = "padding", val = 3 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
