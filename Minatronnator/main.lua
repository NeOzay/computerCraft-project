local HOME = {
	x = 0,
	y = 0,
	z = 0
}

local side = {}
side.top = "top"
side.bottom = "bottom"
side.left = "left"
side.right = "right"
side.front = "front"
side.back = "back"

local fuel_chest = side.back
local fuel_slot = 16


local out_chest = side.top

local width = 16
local height = 16

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
		local ok, text = turtle.forward()
		if not ok then
			print(text)
			os.sleep(2)
			print("retry")
			forward()
		end
	end
end

---@param _side boolean
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
startCheck()
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
	turtle.turnRight()
	turtle.down()
	turtle.digDown()
	refuel()
	empty()
end
