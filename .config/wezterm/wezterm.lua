local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.keys = require("keys")

config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font 'Hack Nerd Font'

config.window_background_opacity = 1.0

config.selection_word_boundary = " \t\n{}[]()\"'`:"

-- config.tab_max_width = 40
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.colors = {
  background = "#272727",
  tab_bar = {
    background = "rgba(0,0,0,0.0)",
  },
}

wezterm.on("format-tab-title", function(tab)
  local index = tab.tab_index
  local is_active = tab.is_active

  local number_bg = is_active and "#a6e3a1" or "#585b70"
  local number_fg = is_active and "#1e1e2e" or "#d9e0ee"

  local title = tostring(tab.active_pane.current_working_dir)
  title = title:match("([^/\\]+)/*$")

  return {
    { Background = { Color = number_bg } },
    { Foreground = { Color = number_fg } },
    { Text = " " .. tostring(index) .. " " },

    { Background = { Color = "#212121" } },
    { Foreground = { Color = "#cdd6f4" } },
    { Text = " " .. title .. " " },
  }
end)

return config
