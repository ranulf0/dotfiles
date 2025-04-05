local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
  { mods = "CTRL|SHIFT",  key = "<", action = act.MoveTabRelative(-1) },
  { mods = "CTRL|SHIFT",  key = ">", action = act.MoveTabRelative(1) },
  { mods = "CTRL|SHIFT",  key = 'F', action = act.Search({Regex = "",}) },
  { mods = "CTRL|SHIFT",  key = "H", action = act.SplitPane({direction = "Left"}) },
  { mods = "CTRL|SHIFT",  key = "J", action = act.SplitPane({direction = "Down"}) },
  { mods = "CTRL|SHIFT",  key = "K", action = act.SplitPane({direction = "Up"}) },
  { mods = "CTRL|SHIFT",  key = "L", action = act.SplitPane({direction = "Right"}) },
  { mods = "CTRL|SHIFT",  key = "N", action = act.ActivatePaneDirection("Next") },
  { mods = "SUPER|SHIFT", key = "H", action = act.ActivatePaneDirection("Left") },
  { mods = "SUPER|SHIFT", key = "J", action = act.ActivatePaneDirection("Down") },
  { mods = "SUPER|SHIFT", key = "K", action = act.ActivatePaneDirection("Up") },
  { mods = "SUPER|SHIFT", key = "L", action = act.ActivatePaneDirection("Right") },
  { mods = "ALT|SHIFT",   key = "T", action = act.SplitPane({ direction = "Down", size = { Percent = 20 } })},
  { mods = "CTRL|SHIFT",  key = "Z", action = act.TogglePaneZoomState },
}

return keys
