--- Allows easier multitasking
---@class parallel
_G.parallel = { }
--- Runs the functions all at once and waits for one to return.
---@param function1 function @ The first function
---@param function2 function @ The second function
---@vararg function @ Any other functions
---@return number
function parallel.waitForAny(function1, function2, ...) end

--- Runs the functions all at once and waits for all to return.
---@param function1 function @ The first function
---@param function2 function @ The second function
---@vararg function @ Any other functions
function parallel.waitForAll(function1, function2, ...) end

