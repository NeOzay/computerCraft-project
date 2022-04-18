local reac = peripheral.find("ic2:reactor_chamber")

local function isEmpty()
	local components = reac.list()
	for key, value in pairs(components) do
		if key or value then
			return false
		end
	end
	return true
end

local function getSide()
	local slot
	for i = 1, 16 do
		local count = turtle.getItemCount(i)
		if count > 0 then
			slot = i
			break
		end
	end
	local sides = reac.getTransferLocations()
	for index, side in ipairs(sides) do
		local n = reac.pullItems(side,slot,1,1)
		if n>0 then
			reac.pushItems(side,1,1,slot)
			return side
		end
	end
end

local findItemCache = {}
local function findItem(ItemName)
	local slot = findItemCache[ItemName]
	local item
	if slot then
		item = turtle.getItemDetail(slot)
	end
	if slot and item and item.name == ItemName then
		return slot
	else
		for i = 1, 16 do
			item = turtle.getItemDetail(i)
			if item and item.name == ItemName then
				findItemCache[ItemName] = i
				return i
			end
		end
	end
	findItemCache[ItemName] = nil
	return -1
end

local function save()
	io.write("layout name: ")
	local name = io.read()
	local components = reac.list()
	local rawData = {}
	for key, value in pairs(components) do
		rawData[key] = value.name
	end
	local data = textutils.serialise(rawData)
	local f = io.open("setup_list/"..name..".lua", "w")
	f:write(data)
	f:close()
	print("layout save")
end

local function load(name)
	local f = io.open("setup_list/"..name, "r")
	local data = textutils.unserialise(f:read("*a"))
	f:close()
	return  data
end



local function setup()
	if not isEmpty() then
		error("reactor is not empty")
	end
	local setup_list = fs.list("setup_list")
	print()
	for index, value in ipairs(setup_list) do
		print(index.."-"..value)
	end
	io.write("choise setup: ")
	local name = setup_list[tonumber(io.read())]
	local componentsList = load(name)
	local side = getSide()
	for i, component in pairs(componentsList) do
		local slot = findItem(component)
		if slot > 0 then
			reac.pullItems(side, slot, 1, i)
		else
			error("no composant "..component.." find")
		end
	end
end

local function main()
	term.clear()
	term.setCursorPos(1,1)
	print("select action")
	print("1: install setup\n2: save setup")
	io.write("choise: ")
	local choise = tonumber(io.read())
	if not fs.exists("setup_list") then
		fs.makeDir("setup_list")
	end
	if choise == 2 then
		save()
	else choise = 1
		setup()
	end
end


main()