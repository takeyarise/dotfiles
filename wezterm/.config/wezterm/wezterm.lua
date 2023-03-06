-- ~/.config/wezterm/wezterm.lua
local wezterm = require('wezterm');

--[[
local mac = wezterm.target_triple:find("darwin")
local windows = wezterm.target_triple:find("windows")
local linux = wezterm.target_triple:find("linux")
if mac then  -- mac 用の設定
  -- hoge
end
--]]

return {
	font = wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal", italic=false}),
    -- font = wezterm.font("UDEV Gothic LG", {weight="Regular", stretch="Normal", style="Normal"}),
	font_size = 12.0,
	use_ime = true,
	color_scheme = "nord",
    audible_bell = "Disabled",
    visual_bell = {
        fade_in_duration_ms = 75,
        fade_out_duration_ms = 75,
        target = "CursorColor",
    },
	-- window_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,
}
