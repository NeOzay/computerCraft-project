local function getPos()
	for i = 1, 3 do
		print("get position...")
		local x, y, z = gps.locate()
		if x and y and z then
			print("position found")
			return x, y, z
		end
		os.sleep(2)
	end
	error("position not found")
end

local orientationList = {}
orientationList[1] = "west"
orientationList.west = 1
orientationList[2] = "north"
orientationList.north = 2
orientationList[3] = "east"
orientationList.east = 3
orientationList[4] = "south"
orientationList.south = 4

---@return "south"|"east"|"north"|"west"
local function getOrientation()
	local loc1 = vector.new(getPos())
	local loc2
	if turtle.forward() then
		loc2 = vector.new(getPos())
		turtle.back()
	elseif turtle.back() then
		loc2 = loc1
		loc1 = vector.new(getPos())
		turtle.forward()
	end
	
	local heading = loc2 - loc1
	print("heading "..tostring(heading), ((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3)), orientationList[((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))])
	return orientationList[((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))]
end

---@type {x:number, z:number, y:number}
local HOME

local width
local height
local starOrientation
if fs.exists("config.lua") then
	local f = io.open("config.lua", "r")
	local data = textutils.unserialise(f:read("*a"))
	if data.finish then
		f:close()
		error("finish!!")
	end
	HOME = data.HOME
	width = data.width
	height = data.height
	starOrientation = data.starOrientation
	f:close()
	print("load config")

else
	local x, y, z = getPos()
	starOrientation = getOrientation()
	HOME = {x = x, z = z, y = y}
	width = 15
	height = 15
	
	local text = textutils.serialise({HOME = HOME, height = height, width = width, starOrientation = starOrientation, finish = false})
	local f = io.open("config.lua", "w")
	f:write(text)
	f:close()
	print("save config")
end





local orientation

local function startCheck()
	turtle.select(15)
	local ender = turtle.getItemDetail()
	turtle.select(16)
	local coal = turtle.getItemDetail()
	if not ender or ender.name ~= "enderstorage:ender_storage" or not coal or coal.name ~= "minecraft:coal" then
		error("no enderchest in 15 slot and coal in 16 slot")
	end
end

local function forward(dis)
	for i = 1, dis or 1 do
		turtle.digDown()
		turtle.dig()
		local ok, text = turtle.forward()
		if not ok then
			print(text)
			os.sleep(2)
			print("retry")
			forward()
		end
	end
end





local function positionnementX(n)
	local _rotate = orientation
	print("rotate "..orientation)
	if n > 0 then
		orientation = "east"
		if _rotate == "south" then
			turtle.turnLeft()
		elseif _rotate == "north" then
			turtle.turnRight()
		elseif _rotate == "west" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		orientation = "west"
		if _rotate == "south" then
			turtle.turnRight()
		elseif _rotate == "north" then
			turtle.turnLeft()
		elseif _rotate == "east" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	end
end

local function positionnementZ(n)
	local _rotate = orientation
	if n < 0 then
		orientation = "north"
		if _rotate == "west" then
			turtle.turnRight()
		elseif _rotate == "east" then
			turtle.turnLeft()
		elseif _rotate == "south" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		orientation = "south"
		if _rotate == "west" then
			turtle.turnLeft()
		elseif _rotate == "east" then
			turtle.turnRight()
		elseif _rotate == "north" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	end
end

---@param side "south"|"east"|"north"|"west"
local function setOrientation(side)
	if not orientation then
		orientation = getOrientation()
	end
	if side == "south" then
		positionnementZ(1)
	elseif side == "north" then
		positionnementZ(-1)
	elseif side =="east" then
		positionnementX(1)
	elseif side == "west" then
		positionnementX(-1)
	end
end

local function gotoStartPoint()
	
	local posx, _, posz = getPos()
	local disx = HOME.x - posx
	local disz = HOME.z - posz
	if disx == 0 and disz == 0 then
		return
	end
	print("disx "..disx)
	print("disz "..disz)
	turtle.up()
	orientation = getOrientation()
	
	positionnementX(disx)
	for i = 1, math.abs(disx) do
		turtle.forward()
	end
	positionnementZ(disz)
	for i = 1, math.abs(disz) do
		turtle.forward()
	end
	turtle.digDown()
	turtle.down()
end

local function gotoTop()
	local _, posy, _ = getPos()
	local disy = HOME.y - posy
	for i = 1, disy do
		turtle.digUp()
		turtle.up()
	end
end

local function finish()
	local f = io.open("config.lua", "r")
	local data = textutils.unserialise(f:read("*a"))
	data.finish = true
	f:close()
	f = io.open("config.lua", "w")
	local text = textutils.serialise(data)
	f:write(text)
	f:close()
end


---@param _side boolean @false right, true left
local function half_turn(_side)
	if _side then
		turtle.turnLeft()
		forward()
		turtle.turnLeft()
	else
		turtle.turnRight()
		forward()
		turtle.turnRight()
	end
end

local function empty()
	turtle.select(15)
	turtle.placeUp()
	for i = 1, 14 do
		turtle.select(i)
		turtle.dropUp()
	end
	turtle.select(15)
	turtle.digUp()
	turtle.select(16)
end

local function refuel()
	if turtle.getFuelLevel()	 < turtle.getFuelLimit() * 2.0 then
		turtle.select(16)
		local count = turtle.getItemCount()
		if count > 1 then
			turtle.refuel(count-1)
		end
	end
end

local sideflip = false

local function main()
	startCheck()
	gotoStartPoint()
	setOrientation(starOrientation)
	while true do
		sideflip = false
		for i = 1, width do
			forward(height)
			half_turn(sideflip)
			sideflip = not sideflip
			empty()
		end
		forward(height)
		turtle.digDown()
		turtle.down()
		turtle.digDown()
		if not turtle.down() then
			gotoTop()
			gotoStartPoint()
			setOrientation(starOrientation)
			finish()
			error("finish!!")
		end
		turtle.turnRight()
		
		
		refuel()
		empty()
	end
end


main()

--print(orientation[getOrientation()])
