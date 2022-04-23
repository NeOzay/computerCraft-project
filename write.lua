local object = peripheral.wrap(peripheral.getNames()[3])

local text = textutils.serialise(object.getMetadata())

local f = io.open("getMetadata.lua", "w")
f:write(text)
f:close()