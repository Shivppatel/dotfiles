local wezterm = require("wezterm")
return {
    color_scheme = "Tokyo Night",
    enable_tab_bar = false,
    font_size = 14.0,
    font = wezterm.font("MesloLGS Nerd Font Mono"),
    macos_window_background_blur = 30,
    window_background_opacity = 1.0,
    window_decorations = "RESIZE",
    keys = {
        {
            key = "f",
            mods = "CTRL",
            action = wezterm.action.ToggleFullScreen,
        },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },
}
