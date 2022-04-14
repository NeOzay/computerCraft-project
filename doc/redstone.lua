--- Controls redstone inputs and outputs.
---@class redstone
_G.redstone = { }
--- Returns the sides available for redstone.
---@return table
function redstone.getSides() end

--- Returns the digital value of the redstone on a side.
---@param side string @ The side to check
---@return boolean
function redstone.getInput(side) end

--- Sets the digital value of the redstone output on a side.
---@param side string @ The side to check
---@param value boolean @ The value to set
function redstone.setOutput(side, value) end

--- Returns the digital value of the redstone that's being output on a side.
---@param side string @ The side to check
---@return boolean
function redstone.getOutput(side) end

--- Returns the analog value of the redstone on a side. (1.51+)
---@param side string @ The side to check
---@return number
function redstone.getAnalogInput(side) end

--- Sets the analog value of the redstone output on a side. (1.51+)
---@param side string @ The side to check
---@param value number @ The value to set
function redstone.setAnalogOutput(side, value) end

--- Returns the analog value of the redstone that's being output on a side. (1.51+)
---@param side string @ The side to check
---@return number
function redstone.getAnalogOutput(side) end

--- Returns the value of the bundled redstone on a side.
---@param side string @ The side to check
---@return number
function redstone.getBundledInput(side) end

--- Sets the value of the bundled redstone output on a side.
---@param side string @ The side to check
---@param colors number @ The value to set as a bitmask of colors
function redstone.setBundledOutput(side, colors) end

--- Returns the value of the bundled redstone that's being output on a side.
---@param side string @ The side to check
---@return number
function redstone.getBundledOutput(side) end

--- Checks if a color is active in a bundled redstone wire.
---@param side string @ The side to check
---@param color color @ The value to set as a bitmask
---@return boolean
function redstone.testBundledOutput(side, color) end

