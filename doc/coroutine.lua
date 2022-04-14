--- Creates and manages parallel tasks.
---@class coroutine
_G.coroutine = { }
--- Creates a coroutine.
---@param f function @ The function to run
---@return coroutine
function coroutine.create(f) end

--- Starts or resumes a coroutine.
---@param coro coroutine @ The coroutine to resume
---@vararg any @ Any parameters to pass to the function, or values to return from coroutine.yield()
---@return any
function coroutine.resume(coro, ...) end

--- Returns the currently running coroutine.
---@return coroutine
function coroutine.running() end

--- Returns the status of a coroutine.
---@param coro coroutine @ The coroutine to check
---@return string
function coroutine.status(coro) end

--- Wraps a coroutine in a function.
---@param f function @ The function to run
---@return function
function coroutine.wrap(f) end

--- Pauses the current coroutine and returns execution to the caller.
---@vararg any @ Any values to return from coroutine.resume()
---@return any
function coroutine.yield(...) end

