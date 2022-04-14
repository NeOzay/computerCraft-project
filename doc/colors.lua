--- Provides constants for colors.
---@class colors
_G.colors = { }
--- Combines one or more colors (or sets of colors) into a larger set.
---@param color1 color @ First color
---@param color2 color @ Second color
---@vararg color @ Other colors
---@return color
function colors.combine(color1, color2, ...) end

--- Removes one or more colors (or sets of colors) from an initial set.
---@param colors color @ Combined color
---@param color1 color @ First color
---@vararg color @ Other colors
---@return color
function colors.subtract(colors, color1, ...) end

--- Tests whether color is contained within colors.
---@param colors color @ A set of colors
---@param color color @ The color to test for
---@return boolean
function colors.test(colors, color) end

--- Combines a three-color RGB value into one hexadecimal representation. (CC:T)
---@param r number @ The red value, from 0.0 to 1.0.
---@param g number @ The green value, from 0.0 to 1.0.
---@param b number @ The blue value, from 0.0 to 1.0.
---@return number
function colors.packRGB(r, g, b) end

--- Separates a hexadecimal RGB color into its three constituent channels. (CC:T)
---@param rgb number @ The RGB hex value to unpack.
---@return number, number, number
function colors.unpackRGB(rgb) end

--- Converts the given color to a paint/blit hex character (0-9, a-f). (CC:T 1.94+)
---@param color color @ The color to convert.
---@return string
function colors.toBlit(color) end

