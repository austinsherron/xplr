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

---@return table: config values for the zoxide plugin
function PluginConfig.zoxide()
  return {
    bin = 'zoxide',
    mode = 'default',
    key = 'Z',
  }
end

return PluginConfig
