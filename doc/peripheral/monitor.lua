---@class monitor
local monitor = {}

---Set the scale of this monitor. A larger scale will result in the monitor having a lower resolution, but display text much larger.
---@param scale number @The monitor's scale. This must be a multiple of 0.5 between 0.5 and 5.
function monitor.setTextScale(scale) end

---Get the monitor's current text scale.
---@return number
function monitor.getTextScale() end

---Write `text` at the current cursor position, moving the cursor to the end of the text.
---
---Unlike functions like `write` and `print`, this does not wrap the text - it simply copies the text to the current terminal line.
---@param text string|number
function monitor.write(text) end

---Move all positions up (or down) by `y` pixels.
---
---Every pixel in the terminal will be replaced by the line `y` pixels below it. If `y` is negative, it will copy pixels from above instead.
---@param y number @The number of lines to move up by. This may be a negative number.
function monitor.scroll(y) end

---Get the position of the cursor.
---@return number, number @x, y position
function monitor.getCursorPos() end

---Set the position of the cursor. terminal writes will begin from this position.
---@param x number
---@param y number
function monitor.setCursorPos(x, y) end

---Checks if the cursor is currently blinking
---@return boolean
function monitor.getCursorBlink() end

---Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean
function monitor.setCursorBlink(blink) end

---Get the size of the terminal.
---@return number number @w terminal
---@return number number @h terminal
function monitor.getSize() end

---Clears the terminal, filling it with the current background colour.
function monitor.clear() end

---Clears the line the cursor is currently on, filling it with the current background colour.
function monitor.clearLine() end

---Return the colour that new text will be written as.
---@return number @The current text colour
function monitor.getTextColor() end

---Set the colour that new text will be written as.
---@param color number @The new text colour.
function monitor.setTextColor(color) end

---Return the current background colour. This is used when writing text and clearing the terminal.
---@return number @The current background colour.
function monitor.getBackgroundColor()	end

---Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour number @The new background colour.
function monitor.setBackgroundColor(colour)	end

---Determine if this terminal supports colour.
---
---Terminals which do not support colour will still allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean
function monitor.isColor() end

---Writes text to the terminal with the specific foreground and background characters.
---
---As with write, the text will be written at the current cursor location, with the cursor moving to the end of the text.
---
---textColour and backgroundColour must both be strings the same length as text. All characters represent a single hexadecimal digit, which is converted to one of CC's colours. For instance, "a" corresponds to purple.
function monitor.blit(text, textColour, backgroundColour) end

---Set the palette for a specific colour.
---
---ComputerCraft's palette system allows you to change how a specific colour should be displayed. For instance, you can make colors.red more red by setting its palette to #FF0000. This does now allow you to draw more colours - you are still limited to 16 on the screen at one time - but you can change which colours are used.
---@param index number
---@param colour number @A 24-bit integer representing the RGB value of the colour. For instance the integer 0xFF0000 corresponds to the colour #FF0000.
---@overload fun(index:number, r:number, g:number, b:number)
function monitor.setPaletteColor(index, colour)	end

---Get the current palette for a specific colour.
---@param colour number @The colour whose palette should be fetched.
---@return number number @red channel between 0 and 1
---@return number number @green channel between 0 and 1
---@return number number @blue channel between 0 and 1
function monitor.getPaletteColor(colour)	end


