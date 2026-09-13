hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

hl.bind("switch:on:Lid Switch", hl.dsp.event("lid-closed"), {locked = true})
hl.bind("switch:off:Lid Switch", hl.dsp.event("lid-opened"), {locked = true})
