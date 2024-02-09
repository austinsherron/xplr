-- plugins ---------------------------------------------------------------------

--[[
  xplr plugin specs
--]]

local Config = require 'xplr.plugins.config'

return {
  ---- xpm: package manager
  { 'dtomvan/xpm.xplr' },
  ---- extra-icons: xplr (dev)icons
  {
    'dtomvan/extra-icons.xplr',
    enabled = false,
  },
  ---- find: interactive finder
  {
    'sayanarijit/find.xplr',
    enabled = false,
  },
  ---- fzf: fzf <-> xplr integration
  {
    'sayanarijit/fzf.xplr',
    main = 'fzf',
    opts = Config.fzf(),
  },
  ---- material-landscape: earthy theme
  {
    'sayanarijit/material-landscape.xplr',
    main = 'material-landscape',
    opts = Config.material(),
  },
  ---- nvim-ctrl: open files to running nvim instances
  {
    'sayanarijit/nvim-ctrl.xplr',
    main = 'nvim-ctrl',
    opts = Config.nvimctrl(),
  },
  ---- tri-pane: three pane layout
  { 'sayanarijit/tri-pane.xplr' },
  ---- zentable: clean ui theme
  {
    'sayanarijit/zentable.xplr',
    main = 'zentable',
  },
  ---- zoxide: zoxide <-> xplr integration
  {
    'sayanarijit/zoxide.xplr',
    main = 'zoxide',
    opts = Config.zoxide(),
  },
}
