local wezterm = require 'wezterm'
local font_family = "IBM Plex Mono Text"

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
	local title = "  " .. without_context(pane.title) .. "  "
	-- local title = "  " .. basename(pane.foreground_process_name) .. "  "

  local is_italic = true

  if tab.is_active then
    is_italic = true
  end

	return {
    {Attribute={Intensity="Normal"}},
    -- {Attribute={Italic=is_italic}},
		{Text=title},
	}
end)

return {
	color_scheme = "Darcula Mono",

	font_size = 12,
	tab_bar_at_bottom = true,
	tab_max_width = 48,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	enable_wayland = false,

	font_rules = {
		{
			italic = true,
			font = wezterm.font(font_family, {italic=true})
		},
		{
			font = wezterm.font(font_family, {italic=false})
		},
		{
			intensity = "Bold",
			font = wezterm.font(font_family, {intensity="Normal"})
		},
	},

	colors = {
		foreground = "#ffffdf",
		-- background = colors.background,
		background = "#121212",

		ansi = {
			colors.background,
			"#c06c43",
			"#afb979",
			"#c2a86c",
			"#626262",
			"#b4be7b",
			"#778284",
			"#feffd3"
		},
		brights = {
			"#262626",
			"#dd7c4c",
			"#cbd88c",
			"#e1c47d", --yello
			"#5a5d61", 
			-- "#D4CD81", --green
			-- "#b1ce80", --green
			-- "#94E09B", --green
			"#c4d188", --green
			-- "#d0db8e", --green
			-- "#8a989a", --cyan
			-- "#BEC4B4",
			"#81857A",
			"#feffd3"  
		},

		indexed = {
			[81]	= "#EBBE78",
			-- [121] = "#AABFB1", --teal
			-- [121] = "8FB8B3", --teal
			[121] = "#A18D5A", --teal
			[224] = "#707862", --red
			-- [224] = "#718076", --red
			[225] = "#AABFB1", --magenta
		},

		tab_bar = {
			background = colors.background,

			active_tab = {
				-- The color of the text for the tab
				fg_color = "#c0c0c0",
				underline = "None",
				strikethrough = false,
				bg_color = colors.background
			},

			inactive_tab = {
				bg_color = colors.background,
				-- fg_color = "#808080",
				fg_color = "#303030",
			},

			new_tab = {
				bg_color = colors.background,
				fg_color = "#808080",
			},
		}
	},


	keys = {
		{key="i", mods="CTRL", action="DisableDefaultAssignment"},
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
		bottom = "1.5cell",
	}
}

