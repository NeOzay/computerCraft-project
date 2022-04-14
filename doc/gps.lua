--- Allows locating the position of a computer or turtle via trilateration over rednet.
---@class gps
_G.gps = { }
--- Locates the current computer or turtle if possible.
---@param timeout number @ The maximim amount of time to wait for a response, defaults to 2
---@param debug boolean @ Whether to print debug messages (optional)
---@return number, number, number; or nil
function gps.locate(timeout, debug) end

