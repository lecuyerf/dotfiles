local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
    automatically_reload_config = true,
    font = wezterm.font("JetBrainsMonoNL Nerd Font", {weight="DemiBold", stretch="Normal", style="Normal"}),
    font_size = 18.0,
    color_scheme = "Catppuccin Macchiato (Gogh)",
    default_cursor_style = "BlinkingBlock",
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    enable_tab_bar = false,
    colors = {
        cursor_bg = "#f5a97f",
        cursor_fg = "#24273a",
        cursor_border = "#f5a97f",
    },
}

return config
