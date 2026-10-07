hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

local function update_monitors()
    if hl.get_monitor("HDMI-A-1") then
        hl.monitor({
            output = "eDP-1",
            disabled = true,
        })
    else
        hl.monitor({
            output = "eDP-1",
            mode = "preferred",
            position = "auto",
            scale = 1,
            disabled = false,
        })
    end
end

hl.on("monitor.added", update_monitors)
hl.on("monitor.removed", update_monitors)

update_monitors()
