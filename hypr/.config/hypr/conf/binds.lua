local mod = "ALT"


-- Applications

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind(mod .. " + C", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("firefox --private-window"))


-- Window management

hl.bind(mod .. " + Q", hl.dsp.window.close())

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))

hl.bind(mod .. " + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + SPACE", hl.dsp.window.float())
hl.bind(mod .. " + SPACE", hl.dsp.window.cycle_next({ tiled = true }))

hl.bind(mod .. " + W", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))


-- Workspaces

for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false, }))
end

hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10, follow = false, }))

hl.bind(mod .. " + B", hl.dsp.focus({ workspace = 217 }))
hl.bind(mod .. " + SHIFT + B", hl.dsp.window.move({ workspace = 217, follow = false, }))


-- Resize windows

hl.bind(mod .. " + CTRL + SHIFT + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + L", hl.dsp.window.resize({ x = 40, y = 0, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -40, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 40, relative = true, }), { repeating = true })


-- Move floating windows

hl.bind(mod .. " + CTRL + SUPER + H", hl.dsp.window.move({ x = -40, y = 0, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SUPER + L", hl.dsp.window.move({ x = 40, y = 0, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SUPER + K", hl.dsp.window.move({ x = 0, y = -40, relative = true, }), { repeating = true })
hl.bind(mod .. " + CTRL + SUPER + J", hl.dsp.window.move({ x = 0, y = 40, relative = true, }), { repeating = true })


-- Mouse

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Dwindle

hl.bind(mod .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + S", hl.dsp.layout("preselect b"))
hl.bind(mod .. " + V", hl.dsp.layout("preselect r"))


-- Reload

hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))


-- Volume

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd( "pactl set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd( "pactl set-sink-volume @DEFAULT_SINK@ -5%"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd( "pactl set-sink-mute @DEFAULT_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd( "pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { repeating = true })


-- Media

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))


-- Brightness

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })


-- Screenshots

hl.bind("Print", hl.dsp.exec_cmd("grimblast copy screen"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd( "grimblast save screen ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd( "grimblast save area ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("grimblast copy active"))
hl.bind(mod .. " + SHIFT + Print", hl.dsp.exec_cmd( "grimblast save active ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"))


-- Keyboard layout toggle

hl.bind("SUPER + SPACE", function()
    local variant = hl.get_config("input.kb_variant")

    if variant == "intl" then
        hl.config({
            input = {
                kb_variant = "",
            },
        })
    else
        hl.config({
            input = {
                kb_variant = "intl",
            },
        })
    end
end)


-- Lock

hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))


-- GitHub notifications

hl.bind("ALT + G", hl.dsp.exec_cmd( "~/.config/github/scripts/rofi.sh"))
