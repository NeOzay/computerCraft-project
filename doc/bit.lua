--- Bit manipulation API
---@class bit
_G.bit = { }
--- Shifts bits left.
---@param n number @ Number to shift
---@param bits number @ Number of bits to shift by
---@return number
function bit.blshift(n, bits) end

--- Shifts bits right arithmetically.
---@param n number @ Number to shift
---@param bits number @ Number of bits to shift by
---@return number
function bit.brshift(n, bits) end

--- Shifts bits right logically.
---@param n number @ Number to shift
---@param bits number @ Number of bits to shift by
---@return number
function bit.blogic_rshift(n, bits) end

--- Performs an exclusive OR on two numbers.
---@param n number @ First number
---@param m number @ Second number
---@return number
function bit.bxor(n, m) end

--- Performs an OR on two numbers.
---@param n number @ First number
---@param m number @ Second number
---@return number
function bit.bor(n, m) end

--- Performs an AND on two numbers.
---@param n number @ First number
---@param m number @ Second number
---@return number
function bit.band(n, m) end

--- Performs a NOT on a number.
---@param n number @ A number
---@return number
function bit.bnot(n) end

