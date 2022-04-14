--- Command computers only: allows executing Minecraft commands. (1.7+)
---@class commands
_G.commands = { }
--- Executes a command string synchronously.
---@param command string @ The command string to run
---@return boolean, table
function commands.exec(command) end

--- Executes a command string asynchronously.
---@param command string @ The command string to run
---@return number
function commands.execAsync(command) end

--- Returns a list of commands.
---@return table
function commands.list() end

--- Returns the world position of the computer.
---@return number, number, number
function commands.getBlockPosition() end

--- Returns information about the block at a position.
---@param x number @ X coordinate
---@param y number @ Y coordinate
---@param z number @ Z coordinate
---@return table
function commands.getBlockInfo(x, y, z) end

--- Returns information about blocks between two positions.
---@param x1 number @ First X coordinate
---@param y1 number @ First Y coordinate
---@param z1 number @ First Z coordinate
---@param x2 number @ Second X coordinate
---@param y2 number @ Second Y coordinate
---@param z2 number @ Second Z coordinate
---@return table
function commands.getBlockInfos(x1, y1, z1, x2, y2, z2) end

