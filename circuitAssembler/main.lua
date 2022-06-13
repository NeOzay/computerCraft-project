local recipes = require("recipes") ---@type table<string, recipe_Item[]>

local drawer = peripheral.wrap("storagedrawers:controller_3") ---@type generic_inventory
local assembler = peripheral.wrap("right") ---@type generic_inventory
local drawerSide = "down"
local monitor = peripheral.wrap("top") ---@type monitor
monitor.clear()
monitor.setTextScale(0.5)

---@return recipe_Item[]
local function selectRecipe()
	local i = 0
	local text = ""
	local list = {} ---@type recipe_Item[][]
	for name, recipe in pairs(recipes) do
		i = i + 1
		text = text.."["..i.."]"..name..","
		table.insert(list, recipe)
	end
	print(text)
	---@type number
	local selection
	while type(selection) ~= "number" do
		selection = tonumber(io.read())
	end
	return list[selection]
end

---@param recipe recipe_Item[]
local function findItems(recipe)
	local itemsSlot = {} ---@type table<string, number>
	local toFound = {} ---@type table<string, recipe_Item>

	for _, item in ipairs(recipe) do
		toFound[item.name..item.damage] = item
	end

	for index, item in pairs(drawer.list()) do
		local itembundle = item.name..item.damage
		local found = toFound[itembundle]
		if found then
			itemsSlot[found.displayName] = index
			toFound[itembundle] = nil
		end
	end

	local missing = {}
	local hasmissing = false
	for _, item in pairs(toFound) do
		if item then
			hasmissing = true
			table.insert(missing, item.displayName)
		end
	end
	if hasmissing then
		local allMissing = table.concat(missing, ", ")
		print(allMissing.." not found")
		error()
	end
	return itemsSlot
end

---@param fromSlot number
---@param pushin number
---@param amount number
---@return number
local function transferToAssembler(fromSlot, pushin, amount)
	return assembler.pullItems(drawerSide, fromSlot, amount, pushin)
end

local function selectAmount()
	local amount ---@type number
	print("amount(number)")
	while type(amount) ~= "number" do
		amount = tonumber(io.read())
	end
	return amount
end

---@param x number
---@param y number
---@param text any
local function write(x, y, text)
	monitor.setCursorPos(x, y)
	monitor.write(tostring(text))
end

---@return recipe_Item[]
---@return number
local function request()
	return selectRecipe(), selectAmount()
end


---@generic K,V
---@param t table<K,V>
---@param index K
---@return K
---@return V
local function getNext(t, index)
	local amount
	index, amount = next(t, index)
	if not index then
		index, amount = next(t)
		sleep(5)
	end
	return index, amount
end

---@generic K,V:integer
---@param t table<K,V>
---@param index K
---@param value V?
---@return K
---@return V
local function check0(t, index, value)
	if value and value == 0 then
		t[index] = nil
		index, value = getNext(t, index)
		return check0(t, index, value)
	end
	return index, value
end

---@param recipe recipe_Item[]
---@param t2 table<number,number>
local function loop(recipe, t2)
	---@param itemAmount table<number,number>
	---@param oldk number
	return function (itemAmount, oldk)
		local index , amount = getNext(itemAmount, oldk)
		index, amount = check0(itemAmount, index, amount)
		local item = recipe[index]
		return index, item, amount
	end, t2
end

---@param index number
---@param slot number
---@param amount number
---@param offset number
local function display(index, slot, amount, offset)
		local storedItem = drawer.getItemMeta(slot)
		write(offset + 4, index, string.format("%.4d", amount))
		write(offset + 10, index, string.format("%.5d", storedItem and storedItem.count or 0))
end

local function main()
	local selectedRecipe, recipeAmount = request()
	local itemsSlot = findItems(selectedRecipe)
	local item_to_transfer = {} ---@type table<number,number>
	local offset = 0

	for index, item in ipairs(selectedRecipe) do
		offset = math.max(offset, #item.displayName)
		write(1, index, item.displayName)
		item_to_transfer[index] = recipeAmount * item.count
	end

	for index, item, itemAmount in loop(selectedRecipe, item_to_transfer) do
		local itemStoredSlot = itemsSlot[item.displayName]
		local transfered = transferToAssembler(itemStoredSlot, index, itemAmount)
		item_to_transfer[index] = itemAmount - transfered
		display(index, itemStoredSlot, item_to_transfer[index], offset)
	end
end

main()

monitor.clear()
