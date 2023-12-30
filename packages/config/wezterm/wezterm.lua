local wezterm = require("wezterm")

local keys = {
	{
		key = "q",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelect,
	},
	{
		key = "h",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "_",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitVertical,
	},
	{
		key = "|",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SplitHorizontal,
	},
}

return {
	font_size = 12.0,
	font = wezterm.font({
		family = "FiraCode Nerd Font",
		weight = "Regular",
	}),

	color_scheme = "Catppuccin Mocha",

	scrollback_lines = 5000,

	keys = keys,

	enable_tab_bar = false,

	default_cursor_style = "SteadyBar",

	check_for_updates = false,
	show_update_window = false,
}
