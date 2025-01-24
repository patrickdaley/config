local wezterm = require("wezterm")
local act = wezterm.action

-- local font_family = "Codelia Ligatures"
-- local font_family = "Cascadia Code"
-- local font_family = "Monaspace Argon"
-- local font_family = "Monaspace Neon"
-- local font_family = "Cartograph CF"
-- local font_family = "Berkeley Mono"
local font_family = "Monolisa"
-- local font_family = "IBM Plex Mono"
-- local font_family = "SF Mono"
-- local font_family = "SFMono Nerd Font"
-- local font_family = "Iosevka SS08"
local scheme = wezterm.color.get_builtin_schemes()["Twilight"]

local function without_context(s)
	return string.gsub(s, "(.+%:%s)", "")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = " " .. without_context(pane.title) .. "  \n"

	return {
		{ Text = title },
	}
end)

local config = {
	color_scheme = "Twilight",
	-- ==
	font = wezterm.font_with_fallback({
		{
			family = font_family,
			weight = "Regular",
			-- weight = "Regular",
			-- weight = "DemiBold",
			-- harfbuzz_features = {
			-- 	"calt",
			-- 	"liga",
			-- 	"dlig",
			-- 	"ss02",
			-- 	"ss03",
			-- 	"ss11",
			-- 	"ss15",
			-- 	"ss16",
			-- 	"ss03",
			-- 	"ss04",
			-- 	"ss05",
			-- 	"ss06",
			-- 	"ss07",
			-- 	"ss08",
			-- },
			-- monaspace
			-- harfbuzz_features = {
			--   "calt",
			--   "liga",
			--   "dlig",
			--   "ss01",
			--   "ss02",
			--   "ss03",
			--   "ss04",
			--   "ss05",
			--   "ss06",
			--   "ss07",
			--   "ss08",
			-- },
		},
	}),

	enable_wayland = true,
	enable_tab_bar = false,
	warn_about_missing_glyphs = false,
	force_reverse_video_cursor = true,
	-- line_height = 1.2,
	-- font_size = 11.25,
	--
	-- line_height = 1.3,
	-- font_size = 11.75,

	line_height = 1.2,
	font_size = 12,
	-- line_height = 1.35,
	-- font_size = 12,
	-- cell_width = 0.9,
	-- bold_brightens_ansi_colors = false,
	freetype_load_flags = "FORCE_AUTOHINT",
	-- freetype_load_flags = "NO_AUTOHINT",
	-- freetype_load_target = "Light",
	-- freetype_load_target = "HorizontalLcd",
	tab_bar_at_bottom = true,
	tab_max_width = 48,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	use_resize_increments = true,
	window_decorations = "NONE",

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
				-- fg_color = scheme.foreground,
				-- fg_color = scheme.ansi[5],
				fg_color = scheme.brights[5],
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
		top = 40,
		right = 36,
		left = 36,
		bottom = 40,
	},

	-- front_end = "WebGpu",
	-- front_end = "OpenGL",
	-- freetype_interpreter_version = 35,
	-- freetype_load_flags = "FORCE_AUTOHINT",
	-- freetype_load_target = "Light",
	-- freetype_load_target = "HorizontalLcd",
}

-- config.keys = {}
for i = 1, 8 do
	-- CMD+ALT + number to activate that window
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

for i = 1, 8 do
	-- CMD+ALT + number to activate that window
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.MoveTab(i - 1),
	})
end

return config
