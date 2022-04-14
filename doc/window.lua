--- Creates window objects.
---@class window
_G.window = { }
--- Creates a new window.
---@param parentTerm table @ The parent terminal of the window (use term.native() instead of term)
---@param x number @ The X coordinate
---@param y number @ The Y coordinate
---@param width number @ The width
---@param height number @ The height
---@param visible boolean @ Whether the window is visible by default (optional)
---@return table
function window.create(parentTerm, x, y, width, height, visible) end

