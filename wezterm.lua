-- ~/.config/wezterm/wezterm.lua
local wezterm = require('wezterm');

return {
	font = wezterm.font("HackGenNerd Console", {weight="Regular", stretch="Normal", italic=false}),
	font_size = 12.0,
	use_ime = true,
	color_scheme = "nord",
	-- window_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,
}
