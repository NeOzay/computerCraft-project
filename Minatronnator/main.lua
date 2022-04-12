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

local function forward()
	turtle.digDown()
	turtle.forward()
end

while true do
	for i = 1, width, 1 do
		forward()
	end
end
