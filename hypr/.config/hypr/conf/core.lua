hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        kb_options = "lv3:ralt_alt",
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
        },
    },

    cursor = {
        no_warps = true,
    },

    general = {
        gaps_in = 10,
        gaps_out = 10,
        layout = "dwindle",
        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(ffffff88)",
                    "rgba(ffffff22)",
                },
                angle = 45,
            },

            inactive_border = "rgba(88888844)",
        },
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    decoration = {
        rounding = 11,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = false,
            size = 8,
            passes = 2,
            new_optimizations = true,
        },
    },

    misc = {
        focus_on_activate = true,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        background_color = "rgb(000000)",
    },
})
