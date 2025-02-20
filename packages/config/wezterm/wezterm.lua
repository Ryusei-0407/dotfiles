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
	font_size = 12.5,
	font = wezterm.font({
		family = "0xProto Nerd Font",
		-- family = "MonaspiceAr Nerd Font",
		weight = "Regular",
	}),

	use_ime = true,

	window_background_opacity = 0.85,
	macos_window_background_blur = 20,

	color_scheme = "Catppuccin Mocha",

	scrollback_lines = 5000,

	keys = keys,

	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_close_tab_button_in_tabs = false,
	tab_bar_at_bottom = true,
	enable_tab_bar = true,

	default_cursor_style = "SteadyBar",

	check_for_updates = false,
	-- show_update_window = false,
}
