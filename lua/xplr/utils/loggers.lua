local Lazy = require 'toolbox.utils.lazy'

local LogLevel = require 'toolbox.log.level'
local Logger = require 'toolbox.log.logger'
local LoggerType = require 'toolbox.log.type'

local level = 'DEBUG'
local logger = Logger.new(LoggerType.XPLR, level)

local LOGGERS = {
  INIT = Lazy.value(function()
    return logger:sub 'INIT'
  end),
  XPM = Lazy.value(function()
    return logger:sub 'XPM'
  end),
}

--- Gets the root logger instance or the scoped sub-logger instance for the provided
--- label.
---
---@param label string|nil: optional; the sub-logger to get
---@return Logger: the root logger instance, if label is nil, or the sub-logger instance
--- for the provided label
---@error if the provided label doesn't correspond to a known sub-logger
return function(label)
  if label == nil then
    return logger
  end

  if LOGGERS[label] == nil then
    error(string.format('No sub-logger=%s', label))
  end

  return LOGGERS[label] --[[@as Logger]]
end
