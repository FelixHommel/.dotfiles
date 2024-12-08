local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font "FiraCode Nerd Font"
config.color_scheme = "nightfox"
config.font_size = 15.0

config.hide_tab_bar_if_only_one_tab =true
config.enable_scroll_bar = true

config.window_frame = {
    font = wezterm.font { family = "FiraCode Nerd Font", weight = "Regular" },
    font_size = 12.0
}

config.keys = {
    {
        key = "c",
        mods = "ALT",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key="s",
        mods="ALT",
        action = wezterm.action.SplitPane {
            direction = "Left",
            command = { args = { "top" } },
            size = { Percent = 50 }
        }
    },
    {
        key="d",
        mods="ALT",
        action = wezterm.action.SplitPane {
            direction = "Down",
            command = { args = { "top" } },
            size = { Percent = 50 }
        }
    },
    {
        key = "LeftArrow",
        mods = "SHIFT",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        key = "RightArrow",
        mods = "SHIFT",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        key = "UpArrow",
        mods = "SHIFT",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        key = "DownArrow",
        mods = "SHIFT",
        action = wezterm.action.ActivatePaneDirection "Down"
    }
}

return config
