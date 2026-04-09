local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"

	if tab.is_active then
		background = "#FF00FF"
		foreground = "#FFFFFF"
	end

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

local keys = {
	{
		key = "q",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelect,
	},
	-- Split and Pane Navigation keybindings
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
	-- Move Tab position
	{
		key = "{",
		mods = "SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "}",
		mods = "SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(1),
	},
	-- Toggle zoom pane
	{
		key = "z",
		mods = "CTRL",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Claude Code keybindings
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\n"),
	},
	{
		key = "g",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SendString("\x07"),
	},
}

return {
	font_size = 10.5,
	font = wezterm.font_with_fallback({
		{ family = "0xProto Nerd Font", weight = "Regular" },
		"ヒラギノ角ゴシック",
		"Noto Color Emoji",
	}),

	use_ime = true,

	window_background_opacity = 0.75,
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
