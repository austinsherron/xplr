local Path = require 'toolbox.system.path'

local PLUGINS_ROOT = Path.config 'xplr' .. '/packages'
local XPM_REPO = 'dtomvan/xpm.xplr'
local XPM_PATH = PLUGINS_ROOT .. '/xpm.xplr'

--- Contains functions for configuring xplr plugins.
---
---@class XplrPluginConfig
local PluginConfig = {}

---@return table: config values for the fzf plugin
function PluginConfig.fzf()
  return {
    mode = 'default',
    key = 'ctrl-f',
    bin = 'fzf',
    args = "--preview 'pistol {}'",
    recursive = false, -- If true, search all files under $PWD
    enter_dir = true, -- Enter if the result is directory
  }
end

---@return table: config values for the material-landscape plugin
function PluginConfig.material()
  return {
    keep_default_layout = true,
  }
end

---@return table: config values for the nvim-ctrl plugin
function PluginConfig.nvimctrl()
  return {
    bin = 'nvim-ctrl',
    mode = 'default',
    keys = {
      ['ctrl-e'] = 'tabedit',
      ['o'] = 'e',
    },
  }
end

---@return table: config values for xpm (plugin manager)
function PluginConfig.xpm()
  return {
    auto_install = true,
    auto_cleanup = true,
    path = XPM_PATH,
    repo = XPM_REPO,
    root = PLUGINS_ROOT,
  }
end

---@return table: config values for the zoxide plugin
function PluginConfig.zoxide()
  return {
    bin = 'zoxide',
    mode = 'default',
    key = 'Z',
  }
end

return PluginConfig
