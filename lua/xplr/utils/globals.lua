---@note: we want global functions w/ lowercased names
---@diagnostic disable: lowercase-global

-- constants
version = '0.21.5' -- needed by xplr

-- xplr config object
XplrConfig = require('toolbox.app.config').new 'xplr'

-- logger factory
GetLogger = require 'xplr.utils.loggers'

-- generally useful, oft imported utils
Array = require 'toolbox.core.array'
Bool = require 'toolbox.core.bool'
Dict = require 'toolbox.core.dict'
Stream = require 'toolbox.extensions.stream'
String = require 'toolbox.core.string'
Table = require 'toolbox.core.table'
Err = require 'toolbox.error.error'
Set = require 'toolbox.extensions.set'
Lazy = require 'toolbox.utils.lazy'
Map = require 'toolbox.utils.map'

-- error handling utils
OnErr = require 'toolbox.error.onerr'
Safe = require 'toolbox.error.safe'

-- generally useful, oft imported util functions
ternary = Bool.ternary
filter = Map.filter
foreach = Map.foreach
map = Map.map
fmt = String.fmt
