local HOME

if fs.exists("config.lua") then
	local f = io.open("config.lua", "r")
	HOME = textutils.unserialise(f:read("*a"))
	print("load config")
else
	local x, _, z = gps.locate()
	local text = textutils.serialise({x = x, z = z})
	local f = io.open("config.lua", "w")
	f:write(text)
	print("save config")
end