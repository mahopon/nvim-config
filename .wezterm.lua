-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 240
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'AdventureTime'

config.default_prog =  { 'C:\\Program Files\\Git\\bin\\bash.exe' }

config.launch_menu =  {
  {
    label = "PowerShell",
    args = { "powershell.exe" }, -- or "powershell.exe" if you don't have pwsh
  },
  {
    label = "Command Prompt",
    args = { "cmd.exe" },
  },
}

-- Finally, return the configuration to wezterm:
return config
