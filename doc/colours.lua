--- Provides constants for colours (UK)
---@class colours
_G.colours = { }
--- Combines one or more colours (or sets of colours) into a larger set.
---@param colour1 color @ First colour
---@param colour2 color @ Second colour
---@vararg color @ Other colours
---@return color
function colours.combine(colour1, colour2, ...) end

--- Removes one or more colours (or sets of colours) from an initial set.
---@param colours color @ Combined colour
---@param colour1 color @ First colour
---@vararg color @ Other colours
---@return color
function colours.subtract(colours, colour1, ...) end

--- Tests whether colour is contained within colours.
---@param colors color @ A set of colours
---@param color color @ The colour to test for
---@return boolean
function colours.test(colors, color) end

--- Combines a three-colour RGB value into one hexadecimal representation. (CC:T)
---@param r number @ The red value, from 0.0 to 1.0.
---@param g number @ The green value, from 0.0 to 1.0.
---@param b number @ The blue value, from 0.0 to 1.0.
---@return number
function colours.packRGB(r, g, b) end

--- Separates a hexadecimal RGB colour into its three constituent channels. (CC:T)
---@param rgb number @ The RGB hex value to unpack.
---@return number, number, number
function colours.unpackRGB(rgb) end

--- Converts the given colour to a paint/blit hex character (0-9, a-f). (CC:T 1.94+)
---@param colour color @ The colour to convert.
---@return string
function colours.toBlit(colour) end

