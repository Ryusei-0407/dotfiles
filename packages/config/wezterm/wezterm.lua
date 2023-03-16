local wezterm = require("wezterm")

local colors = {
	foreground = "#f8f8f2",
	background = "#22212c",

	ansi = { "#22212c", "#ff9580", "#8aff80", "#ffff80", "#9580ff", "#ff80bf", "#80ffea", "#f8f8f2" },
	brights = { "#6272a4", "#ffaa99", "#a2ff99", "#ffff99", "#aa99ff", "#ff99cc", "#99ffee", "#ffffff" },
}

local keys = {
	{
		key = "q",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelect,
	},
}

return {
	font = wezterm.font("FiraCode Nerd Font", { font_size = 13.0, weight = "Bold" }),

	colors = colors,

	scrollback_lines = 5000,

	keys = keys,

    enable_tab_bar = false,

    window_decorations = "NONE"
}
