--- Formats and manipulates strings.
---@class textutils
_G.textutils = { }
--- Writes text to the screen slowly.
---@param text string @ The text to write
---@param rate number @ The number of characters to write per second
function textutils.slowWrite(text, rate) end

--- Writes text to the screen slowly, with a newline.
---@param text string @ The text to write
---@param rate number @ The number of characters to write per second
function textutils.slowPrint(text, rate) end

--- Returns a string representing a Minecraft time in either 12-hour or 24-hour time.
---@param time number @ The time to format
---@param twentyFourHour boolean @ Whether to display the time in 24-hour time (optional)
---@return string
function textutils.formatTime(time, twentyFourHour) end

--- Prints rows of values in an ordered form, changing the text color if one is encountered.
---@vararg table/color @ The rows to display or the color of the text
function textutils.tabulate(...) end

--- Prints rows of values in an ordered form, changing the text color if one is encountered (paged).
---@vararg table/color @ The rows to display or the color of the text
function textutils.tabulate(...) end

--- Prints text, but waits to scroll if too much text is displayed.
---@param text string @ The text to write
---@param freeLines number @ The number of lines to write before waiting (optional)
---@return number
function textutils.pagedPrint(text, freeLines) end

--- Converts a value into a string representation.
---@param data any @ The value to convert
---@return string
function textutils.serialize(data) end

--- Converts a value into a string representation. (1.6+)
---@param data any @ The value to convert
---@return string
function textutils.serialise(data) end

--- Converts a string representation into a value.
---@param data string @ The value to convert
---@return any
function textutils.unserialize(data) end

--- Converts a string representation into a value. (1.6+)
---@param data string @ The value to convert
---@return any
function textutils.unserialise(data) end

--- Converts a value into a JSON string. (1.7+)
---@param data any @ The value to convert
---@param unquote_keys boolean @ Whether to strip the quotation marks from keys (for MC commands)
---@return string
function textutils.serialize(data, unquote_keys) end

--- Converts a value into a JSON string. (1.7+)
---@param data any @ The value to convert
---@param unquote_keys boolean @ Whether to strip the quotation marks from keys (for MC commands)
---@return string
function textutils.serialise(data, unquote_keys) end

--- Converts a JSON string into a Lua value. (CC:T 1.87+)
---@param string string @ The JSON string to decode
---@param options table @ A table with any of the fields 'nbt_style' and 'parse_null'
---@return any
function textutils.unserializeJSON(string, options) end

--- Converts a JSON string into a Lua value. (CC:T 1.87+)
---@param string string @ The JSON string to decode
---@param options table @ A table with any of the fields 'nbt_style' and 'parse_null'
---@return any
function textutils.unserialiseJSON(string, options) end

--- Makes a string safe for a URL.
---@param urlUnsafeString string @ The string to encode
---@return string
function textutils.urlEncode(urlUnsafeString) end

--- Returns a list of suffixes that could be combined with a prefix in an environment. (1.74+)
---@param partial_name string @ Part of a variable name
---@param environment table @ The environment to search in (optional)
---@return table
function textutils.complete(partial_name, environment) end

