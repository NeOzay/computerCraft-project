--- Provides functions for writing to the terminal.
---@class term
_G.term = { }
--- Writes text to the screen.
---@param text string @ The text to write
function term.write(text) end

--- Writes text to the screen using specific colors.
---@param text string @ The text to write
---@param text_colors string @ The colors of the text
---@param background_colors string @ The colors of the background
function term.blit(text, text_colors, background_colors) end

--- Clears the screen.
function term.clear() end

--- Clears the current line.
function term.clearLine() end

--- Returns the current position of the cursor.
---@return number, number
function term.getCursorPos() end

--- Sets the current position of the cursor.
---@param x number @ The X position
---@param y number @ The Y position
function term.setCursorPos(x, y) end

--- Sets whether the cursor should blink.
---@param bool boolean @ Whether to blink the cursor
function term.setCursorBlink(bool) end

--- Returns whether the cursor blinks.
---@return boolean
function term.getCursorBlink() end

--- Returns whether the terminal supports color.
---@return boolean
function term.isColor() end

--- Returns whether the terminal supports colour.
---@return boolean
function term.isColour() end

--- Returns the size of the terminal.
---@return number, number
function term.getSize() end

--- Scrolls the screen a number of lines.
---@param n number @ The number of lines to scroll
function term.scroll(n) end

--- Redirects the terminal output to another terminal.
---@param target table @ The terminal to redirect to
---@return table
function term.redirect(target) end

--- Returns the current terminal object. (1.6+)
---@return table
function term.current() end

--- Returns the original terminal object. (1.6+)
---@return table
function term.native() end

--- Sets the current text color.
---@param color color @ The color to set
function term.setTextColor(color) end

--- Sets the current text colour.
---@param colour color @ The colour to set
function term.setTextColour(colour) end

--- Sets the current background color.
---@param color color @ The color to set
function term.setBackgroundColor(color) end

--- Sets the current background colour.
---@param colour color @ The colour to set
function term.setBackgroundColour(colour) end

--- Gets the current text color. (1.74+)
---@return color
function term.getTextColor() end

--- Gets the current text colour. (1.74+)
---@return color
function term.getTextColour() end

--- Gets the current background color. (1.74+)
---@return color
function term.getBackgroundColor() end

--- Gets the current background colour. (1.74+)
---@return color
function term.getBackgroundColour() end

--- Returns the original RGB values of the specified color. (CC:T 1.81+)
---@param color color @ The color to get the default for
---@return number, number, number
function term.nativePaletteColor(color) end

--- Returns the original RGB values of the specified colour. (CC:T 1.81+)
---@param color color @ The colour to get the default for
---@return number, number, number
function term.nativePaletteColour(color) end

