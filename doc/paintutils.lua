--- Allows drawing on the screen.
---@class paintutils
_G.paintutils = { }
--- Loads and returns an image from a file.
---@param path string @ The path to the file to load
---@return table
function paintutils.loadImage(path) end

--- Draws an image on the screen.
---@param image table @ The image to draw
---@param x number @ The X coordinate
---@param y number @ The Y coordinate
function paintutils.drawImage(image, x, y) end

--- Draws a pixel on the screen.
---@param x number @ The X coordinate
---@param y number @ The Y coordinate
---@param color color @ The color to paint with
function paintutils.drawPixel(x, y, color) end

--- Draws a line on the screen.
---@param startX number @ The first X coordinate
---@param startY number @ The first Y coordinate
---@param endX number @ The second X coordinate
---@param endY number @ The second Y coordinate
---@param color color @ The color to paint with
function paintutils.drawLine(startX, startY, endX, endY, color) end

--- Draws a box on the screen. (1.64+)
---@param startX number @ The first X coordinate
---@param startY number @ The first Y coordinate
---@param endX number @ The second X coordinate
---@param endY number @ The second Y coordinate
---@param color color @ The color to paint with
function paintutils.drawBox(startX, startY, endX, endY, color) end

--- Draws a filled box on the screen. (1.64+)
---@param startX number @ The first X coordinate
---@param startY number @ The first Y coordinate
---@param endX number @ The second X coordinate
---@param endY number @ The second Y coordinate
---@param color color @ The color to paint with
function paintutils.drawFilledBox(startX, startY, endX, endY, color) end

