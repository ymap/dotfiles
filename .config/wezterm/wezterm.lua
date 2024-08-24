local wezterm = require 'wezterm';
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
config.font = wezterm.font('MyricaMonospace Nerd Font')
config.font_size = 30.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.keys = {
  {
    key = '¥',
    mods = 'CTRL|ALT',
    action = wezterm.action.SendKey { key = "\\", mods = 'CTRL' },
  },
}

return config
