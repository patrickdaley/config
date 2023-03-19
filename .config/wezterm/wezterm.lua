local wezterm = require("wezterm")

-- local font_family = "IBM Plex Mono"
-- local font_family = "Liberation Mono"
-- local font_family = "SF Mono"
-- local font_family = "SF Mono"
-- local font_family = "Iosevka SS08"
local scheme = wezterm.color.get_builtin_schemes()["Twilight"]

-- local function basename(s)
-- 	return string.gsub(s, "(.*[/\\])(.*)", "%2")
-- end

local function without_context(s)
	return string.gsub(s, "(.+%:%s)", "")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = " " .. without_context(pane.title) .. "  \n"
	-- local title = "  " .. basename(pane.foreground_process_name) .. "  "

	return {
		{ Attribute = { Intensity = "Normal" } },
		-- {Attribute={Italic=is_italic}},
		{ Text = title },
	}
end)

return {
	color_scheme = "Twilight",

	line_height = 1.2,
	font_size = 12,
	-- cell_width = 0.9,
	bold_brightens_ansi_colors = false,
	tab_bar_at_bottom = true,
	tab_max_width = 48,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	use_resize_increments = true,
	window_decorations = "RESIZE",

	-- font = wezterm.font_with_fallback({
	-- 	{ family = "SF Mono", weight = "Medium", scale = 1 },
	-- }),
	font = wezterm.font_with_fallback({
		{ family = "SF Mono", weight = "Medium", scale = 1.04 },
	}),

	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font_with_fallback({
				{ family = "SF Mono", weight = "Medium", scale = 1.04 },
			}),
		},
	},

	-- freetype_load_target = "Light",
	-- freetype_render_target = "HorizontalLcd",
	--
	-- font_rules = {
	-- 	{
	-- 		italic = true,
	-- 		font = wezterm.font(font_family, { italic = true }),
	-- 	},
	-- 	{
	-- 		intensity = "Normal",
	-- 		font = wezterm.font(font_family, { italic = false }),
	-- 	},
	-- 	{
	-- 		intensity = "Bold",
	-- 		font = wezterm.font(font_family, { intensity = "Normal" }),
	-- 	},
	-- },

	colors = {
		indexed = {
			[121] = scheme.ansi[8],
			[81] = scheme.ansi[2],
			[224] = scheme.brights[5],
			-- [225] = "red"
		},

		tab_bar = {
			background = scheme.background,

			active_tab = {
				fg_color = scheme.foreground,
				bg_color = scheme.background,
				underline = "None",
				strikethrough = false,
			},

			inactive_tab = {
				bg_color = scheme.background,
				fg_color = scheme.ansi[5],
			},

			new_tab = {
				bg_color = scheme.background,
				fg_color = scheme.brights[5],
			},
		},
	},

	keys = {
		{ key = "i", mods = "CTRL", action = "DisableDefaultAssignment" },
		{ key = "{", mods = "SHIFT|ALT", action = wezterm.action({ MoveTabRelative = -1 }) },
		{ key = "}", mods = "SHIFT|ALT", action = wezterm.action({ MoveTabRelative = 1 }) },
	},

	window_padding = {
		-- top = 0,
		-- right = 0,
		-- left = 0,
		-- bottom = 0,
		top = ".5cell",
		right = "1cell",
		bottom = ".5cell",
		left = "1cell",
	},
}
