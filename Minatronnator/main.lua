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

local width = 5
local height = 5

local function forward(dis)
	for i = 1, dis or 1 do
		turtle.digDown()
		turtle.forward()
	end
end

---@param _side '"left"'|'"right"'
local function half_turn(_side)
	if _side == "left" then
		turtle.turnLeft()
		forward()
		turtle.turnLeft()
	end

	if _side == "right" then
		turtle.turnRight()
		forward()
		turtle.turnRight()
	end
end

for i = 1, math.floor(width/2) do
	forward(height)
	half_turn("left")
	forward(height)
	half_turn("right")
end
turtle.down()
turtle.digDown()
