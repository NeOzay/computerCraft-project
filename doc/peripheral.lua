---@alias sidesList "bottom"|"top"|"back"|"front"|"right"|"left"

--- Interacts with peripherals.
---@class peripheral
_G.peripheral = { }
--- Checks if a peripheral is present on a side.
---@param side sidesList @ The side to check
---@return boolean
function peripheral.isPresent(side) end

--- Returns the type of peripheral on a side.
---@param side sidesList|table @ The side or wrapped peripheral to check
---@return string|nil
function peripheral.getType(side) end

--- Returns a list of methods that the peripheral has.
---@param side sidesList @ The side to check
---@return table|nil
function peripheral.getMethods(side) end

--- Returns the side a wrapped peripheral is on. (CC:1 1.88+)
---@param peripheral table @ The peripheral to check
---@return string|nil
function peripheral.getName(peripheral) end

--- Calls a method on a peripheral.
---@param side string @ The side to check
---@param method string @ The method to call
---@vararg any @ Any arguments to pass to the method
---@return any
function peripheral.call(side, method, ...) end

--- Returns a table containing all of the methods of a peripheral.
---@param side sidesList @ The side or adress to check
---@return table|nil
function peripheral.wrap(side) end

--- Finds peripherals of a type and returns their tables of methods. (1.6+)
---@param type string @ The type of peripheral to find
---@param fnFilter? fun(name: string, wrapped: table) @ A function that filters through the entries
---@return table|nil
function peripheral.find(type, fnFilter) end

--- Returns a list of names of connected peripherals.
---@return string[]
function peripheral.getNames() end

