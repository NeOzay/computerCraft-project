--- Controls transferring data over modems.
---@class rednet
_G.rednet = { }
--- Opens a side for transcieving.
---@param side string @ The side to open
function rednet.open(side) end

--- Closes a side for transcieving.
---@param side string @ The side to close
function rednet.close(side) end

--- Sends a message to a computer.
---@param recieverID string @ The ID of the computer to recieve the message
---@param message any @ The message to send
---@param protocol string @ The protocol to use (1.6+)
function rednet.send(recieverID, message, protocol) end

--- Sends a message to all computers.
---@param message any @ The message to send
---@param protocol string @ The protocol to use (1.6+)
function rednet.broadcast(message, protocol) end

--- Waits for a message to be received, then returns the received message.
---@param protocolFilter string @ The protocol to search for, requires timeout to be specified after
---@param timeout number @ The maximim amount of time to wait for a message, defaults to 2
---@return number, any, number/string
function rednet.receive(protocolFilter, timeout) end

--- Checks if a modem is open.
---@param side string @ The side to check
---@return boolean
function rednet.isOpen(side) end

--- Adds a hostname for a protocol for rednet.lookup(). (1.6+)
---@param protocol string @ The protocol to use
---@param hostname string @ The hostname to use
function rednet.host(protocol, hostname) end

--- Removes a hostname for a protocol for rednet.lookup(). (1.6+)
---@param protocol string @ The protocol to use
---@param hostname string @ The hostname to use
function rednet.unhost(protocol, hostname) end

--- Searches for a hostname or a protocol. (1.6+)
---@param protocol string @ The protocol to use
---@param hostname string @ The hostname to use (optional)
function rednet.lookup(protocol, hostname) end

