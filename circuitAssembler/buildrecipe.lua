local ass = peripheral.wrap("right")

local itemsList = ass.list()

local recipes = require("recipes")

local recipeName = io.read()

local recipe = {}

for i = 1, 6 do
	itemsList[i].displayName = ass.getItemMeta(i).displayName
	recipe[i] = itemsList[i]
end
recipes[recipeName] = recipe

local file = io.open("recipes", "w")
file:write("return "..textutils.serialise(recipes))
file:close()

---@class Item
---@field name string
---@field damage number
---@field count number
---@field displayName? string