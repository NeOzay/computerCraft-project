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


local orientation = {}
orientation[1] = "west"
orientation.west = 1
orientation[2] = "north"
orientation.north = 2
orientation[3] = "east"
orientation.east = 3
orientation[4] = "south"
orientation.south = 4


local width = 16
local height = 16
local rotate

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
	for i = 2, dis or 2 do
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

local function getPos()
	local x, y, z = gps.locate()
	return {x = x, y = y, z = z}
end

function getOrientation()
	local loc1 = vector.new(gps.locate())
	local loc2
	if turtle.forward() then
		loc2 = vector.new(gps.locate())
		turtle.back()
	elseif turtle.back() then
		loc2 = loc1
		loc1 = vector.new(gps.locate())
		turtle.forward()
	end

	local heading = loc2 - loc1
	print(heading)
	return orientation[((heading.x + math.abs(heading.x) * 2) + (heading.z + math.abs(heading.z) * 3))]
end

function positionnementX(n)
	local _rotate = rotate
	if n > 0 then
		rotate = "east"
		if _rotate == "south" then
			turtle.turnLeft()
		elseif _rotate == "north" then
			turtle.turnRight()
		elseif _rotate == "west" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		rotate = "west"
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

function positionnementZ(n)
	local _rotate = rotate
	if n < 0 then
		rotate = "north"
		if _rotate == "west" then
			turtle.turnRight()
		elseif _rotate == "east" then
			turtle.turnLeft()
		elseif _rotate == "south" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		rotate = "south"
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

local function gotoStartPoint()

	local pos = getPos()
	local disx = HOME.x - pos.x
	local disz = HOME.z - pos.z
	if disx == 0 and disz == 0 then
		return
	end
	print("disx "..disx)
	print("disz "..disz)
	turtle.up()
	rotate = getOrientation()

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
	if turtle.getFuelLevel() < turtle.getFuelLimit() * 2.0 then
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
	positionnementZ(-1)
	while true do
		sideflip = false
		for i = 1, width - 1 do
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
			os.exit()	
		end
		turtle.turnRight() 
			
		
		refuel()
		empty()
	end
end

main()

--print(orientation[getOrientation()])