--- Controls settings for CraftOS and programs. (1.77+)
---@class settings
_G.settings = { }
--- Sets a setting in the current settings.
---@param name string @ The key for the setting
---@param value any @ The value for the setting
function settings.set(name, value) end

--- Gets a setting from the current settings.
---@param name string @ The key for the setting
---@param default any @ The default value to return if it doesn't exist
---@return any
function settings.get(name, default) end

--- Removes a setting in the current settings.
---@param name string @ The key for the setting
function settings.unset(name) end

--- Clears all settings.
function settings.clear() end

--- Returns a list of keys.
---@return table
function settings.getNames() end

--- Loads settings from a file.
---@param path string @ The file to access
function settings.load(path) end

--- Saves settings to a file.
---@param path string @ The file to access
function settings.save(path) end

--- Returns a table with details about a setting. (CC:t 1.87+)
---@param name string @ The name of the setting
---@return table/nil
function settings.getDetails(name) end

--- Defines a new setting, optionally specifying various properties about it. (CC:T 1.87+)
---@param name string @ The name of the setting to define
---@param options table @ A table with any of the fields 'description', 'default', and 'type'.
function settings.define(name, options) end

--- Removes a previously defined setting. (CC:T 1.87+)
---@param name string @ The name of the setting to undefine
function settings.undefine(name) end

