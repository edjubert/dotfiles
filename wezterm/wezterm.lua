local wezterm = require 'wezterm'

return {
  color_scheme = 'Banana Blueberry',
  window_background_opacity = 0.7,
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8
  },
  font = wezterm.font_with_fallback {
    { family = 'Iosevka Term' },
    {
      family = 'JetBrains Mono',
      weight = 'Medium',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    },
    { family = 'Terminus', weight = 'Bold' },
    'Noto Color Emoji',
  },
  use_fancy_tab_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  hide_tab_bar_if_only_one_tab = true
}
