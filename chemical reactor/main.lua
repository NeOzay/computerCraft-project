local assembler = peripheral.wrap("gregtech:machine_0")
local buffer = peripheral.wrap("left")

local fluidsList = {}
local side = "up"

if not assembler or not buffer then
	print("peripheral not found")
	error()
end

local function getLiquidInChem()
	local _fluidsList = assembler.getTanks()
	for i = 1, 3 do
		if _fluidsList[i].name then
			return _fluidsList[i].name
		end
	end
end


local toFound = {"iron_iii_chloride", "sodium_persulfate"}
local function sortFluid(fluidList)
	local list = {}
	for _, fluidName in ipairs(toFound) do
		for index, fluid in ipairs(fluidList) do
			if fluid.name == fluidName then
				table.insert(list, fluid)
			end
		end
	end
	return ipairs(list)
end

while true do
	local current = getLiquidInChem()
	if not current then
		for index, fluid in sortFluid(buffer.getTanks()) do
			if fluid.amount >= 2000 then
				assembler.pullFluid(side, 2000, fluid.name)
				break
			end
		end
	end
	sleep(5)
end