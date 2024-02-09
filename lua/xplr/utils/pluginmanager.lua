local Lambda = require 'toolbox.functional.lambda'

local xpm = require 'xpm'

--- Responsible for xplr plugin orchestration.
---
--- @class XplrPluginMgr
local PluginManager = {}

local function validate_plugin(plugin)
  local git_path = Table.safeget(plugin, 1)

  if String.nil_or_empty(git_path) then
    Err.raise 'no git path found for plugin'
  end

  return git_path
end

local function make_setup_fn(opts)
  if type(opts.setup) == 'function' then
    return function()
      return opts.setup(opts.opts)
    end
  elseif String.not_nil_or_empty(opts.main) then
    return function()
      return require(opts.main).setup(opts.opts)
    end
  end
end

local function create_spec(plugin)
  validate_plugin(plugin)
  local opts, spec = Table.split(plugin, { 'enabled', 'main', 'opts' })

  if opts.enabled == false then
    return nil
  end

  return Table.combine(spec or {}, { setup = make_setup_fn(opts or {}) })
end

local function create_specs(plugins)
  return Stream.new(plugins):map(create_spec):filter(Lambda.NOT(Lambda.NIL)):collect()
end

local function get_plugin_defs(plugins)
  if Table.is(plugins) then
    return plugins
  end

  return require(plugins)
end

--- Initializes the xplr plugin manager.
---
---@param plugins string|table: a string lua path to an importable source of plugin
--- definitions, or a table that already contains
--- plugin definitions.
function PluginManager.init(plugins)
  local defs = get_plugin_defs(plugins or {})
  local specs = create_specs(defs)

  xpm.setup({
    plugins = specs,
    auto_install = true,
    auto_cleanup = true,
  })
end

return PluginManager
