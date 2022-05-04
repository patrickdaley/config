local wezterm = require 'wezterm'

--font = "Cascadia Code PL SemiLight"
font = "SF Mono"

colors = {
	background = "#141414",
	foreground = "#ffffdf",
}

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function without_context(s)
	return string.gsub(s, "(.+%:%s)", "")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = without_context(pane.title)
	-- local title = "  " .. basename(pane.foreground_process_name) .. "  "
	return {
		{Text="  " .. title .. "  "}
	}
end)

return {

	font_size = 13,
	tab_bar_at_bottom = true,
	tab_max_width = 48,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	enable_wayland = false,

	colors = {
		foreground = "#ffffdf",
		background = colors.background,

		ansi = {colors.background, "#c06c43", "#afb979", "#c2a86c", "#626262", "#b4be7b", "#778284", "#feffd3"},
	      	brights = {"#262626", "#dd7c4c", "#cbd88c", "#e1c47d", "#5a5d61", "#d0db8e", "#8a989a", "#feffd3"},

		indexed = {
			[121] = "#929489"
		},

		tab_bar = {
			background = colors.background,

			active_tab = {
				-- The color of the text for the tab
				fg_color = "#c0c0c0",
				intensity = "Normal",
				underline = "None",
				italic = true,
				strikethrough = false,
				bg_color = colors.background
			},

			inactive_tab = {
				bg_color = colors.background,
				fg_color = "#808080",
			},

			new_tab = {
				bg_color = colors.background,
				fg_color = "#808080",
			},
		}
	},

	font_rules = {
		{
			intensity = "Normal",
			font = wezterm.font(font)
		},
		{
			intensity = "Bold",
			font = wezterm.font(font)
		},
	},

	keys = {
		{key="[", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
		{key="]", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
		{key="{", mods="SHIFT|ALT", action=wezterm.action{MoveTabRelative=-1}},
		{key="}", mods="SHIFT|ALT", action=wezterm.action{MoveTabRelative=1}},
	},

	window_frame = {
		active_titlebar_bg = colors.background,
		inactive_titlebar_bg = colors.background,
	},

	window_padding = {
		left = "2cell",
		right = "2cell",
		top = "1.5cell",
		bottom = "1cell",
	}
}

